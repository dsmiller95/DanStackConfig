/**
 * Generic memoization function
 */
export const memoize = <T>(fn: () => T): (() => T) => {
  let cached: T | undefined;
  let hasValue = false;
  return () => {
    if (!hasValue) {
      cached = fn();
      hasValue = true;
    }
    return cached as T;
  };
};
