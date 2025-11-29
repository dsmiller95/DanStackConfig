#!/usr/bin/env node

import { execSync } from "child_process";
import { existsSync, copyFileSync } from "fs";
import { homedir, platform } from "os";
import { join, resolve, dirname } from "path";
import { fileURLToPath } from "url";
import chalk from "chalk";
import { memoize } from "./lib.js";

interface ConfigFile {
  source: string;
  target: string;
  description: string;
}

const getHomeDir = memoize(() => homedir());
const getIsWindows = memoize(() => platform() === "win32");
const getRepoRoot = memoize(() => {
  const __filename = fileURLToPath(import.meta.url);
  const __dirname = dirname(__filename);
  return resolve(__dirname, "../../..");
});

/**
 * Execute a shell command and return output
 */
const exec = (command: string): string => {
  try {
    return execSync(command, { encoding: "utf-8" }).trim();
  } catch {
    return "";
  }
};

/**
 * Check if a command exists in PATH
 */
const commandExists = (command: string): boolean => {
  try {
    const checkCmd = getIsWindows() ? `where ${command}` : `which ${command}`;
    execSync(checkCmd, { stdio: "ignore" });
    return true;
  } catch {
    return false;
  }
};

/**
 * Apply git configuration and aliases
 */
const applyGitConfig = (): void => {
  console.log(chalk.yellow("📝 Configuring Git..."));

  if (!commandExists("git")) {
    console.log(
      chalk.red("  ✗ Git is not installed. Skipping git configuration.")
    );
    return;
  }

  const gitAliasesScript = join(getRepoRoot(), "git-aliases.sh");

  if (!existsSync(gitAliasesScript)) {
    console.log(
      chalk.red("  ✗ Git aliases script not found at:"),
      gitAliasesScript
    );
    return;
  }

  try {
    const isWindows = getIsWindows();
    const shellCmd = isWindows ? "bash" : "sh";

    exec(`${shellCmd} "${gitAliasesScript}"`);
    console.log(chalk.green("  ✓ Applied git aliases from script"));
  } catch (error) {
    console.log(
      chalk.red("  ✗ Error applying git config:"),
      (error as Error).message
    );
  }
};

/**
 * Display system information
 */
const displaySystemInfo = (): void => {
  console.log(chalk.yellow("\n💻 System Information:"));
  console.log(`  Platform: ${platform()}`);
  console.log(`  Node.js: ${process.version}`);
  console.log(`  Home Directory: ${getHomeDir()}`);
  console.log(`  Repository Root: ${getRepoRoot()}`);

  const gitVersion = exec("git --version");
  if (gitVersion) {
    console.log(`  Git: ${gitVersion}`);
  }
};

/**
 * Main deployment routine
 */
const deploy = async (): Promise<void> => {
  try {
    console.log(chalk.blue.bold("\n🚀 DanStack Configuration Deployer\n"));

    displaySystemInfo();
    applyGitConfig();

    console.log(chalk.green.bold("\n✨ Configuration deployment complete!\n"));
    console.log(
      chalk.cyan(
        "To use the git aliases, they have been added to your global git config."
      )
    );
    console.log(chalk.cyan("Try running: git aliases\n"));
  } catch (error) {
    console.error(
      chalk.red.bold("\n❌ Deployment failed:"),
      (error as Error).message
    );
    process.exit(1);
  }
};

// Run the deployer
deploy().catch((error) => {
  console.error(chalk.red("Fatal error:"), error);
  process.exit(1);
});
