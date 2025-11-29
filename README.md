# DanStack Configuration Management

A repository containing personal system configuration and automated deployment tools.

## 📁 Structure

- **`.gitconfig`** - Git CLI command aliases and shortcuts
- **`deploy/`** - Node.js TypeScript project for deploying configurations

## 🚀 Quick Start

### Install Dependencies

```bash
cd deploy
npm install
```

### Deploy Configuration

```bash
cd deploy
npm run deploy
```

This will:
- Apply git aliases to your global git configuration
- Copy configuration files to appropriate locations
- Display system information

## 📝 Git Aliases

The repository includes a comprehensive set of git aliases. After running the deployment script, you can use shortcuts like:

- `git st` - Status
- `git cm "message"` - Commit with message
- `git co branch-name` - Checkout branch
- `git lg` - Pretty log with graph
- `git aliases` - List all configured aliases

See `.gitconfig` for the complete list of available aliases.

## 🛠️ Development

### Build the Project

```bash
cd deploy
npm run build
```

### Watch Mode

```bash
cd deploy
npm run watch
```

### Run Without Building

```bash
cd deploy
npm run dev
```

## 📦 What Gets Deployed

The deployment script currently manages:

1. **Git Configuration** - Applies aliases from `.gitconfig` to global git config
2. **Configuration Files** - Copies configuration files to home directory

## 🔧 Customization

To add your own configurations:

1. Add configuration files to the repository root
2. Update `deploy/src/index.ts` to include new deployment logic
3. Run `npm run deploy` to apply changes

## 📄 License

MIT
