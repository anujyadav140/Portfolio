"use client";

import * as React from "react";
import { useTheme } from "next-themes";
// import { Moon, Sun } from "lucide-react";
import { motion } from "framer-motion";

export function ThemeToggle() {
    // Use resolvedTheme to get the actual theme (handles "system" setting)
    const { theme, setTheme, resolvedTheme } = useTheme();
    const [mounted, setMounted] = React.useState(false);

    React.useEffect(() => {
        setMounted(true);
    }, []);

    // Show a styled placeholder button while hydrating to prevent blank circle
    if (!mounted) {
        return (
            <div className="relative p-2 rounded-full bg-secondary/50 text-foreground backdrop-blur-sm border border-border w-10 h-10 flex items-center justify-center">
                <span className="text-base opacity-50">🌓</span>
            </div>
        );
    }

    // Use resolvedTheme with fallback to "dark" to ensure an icon is always shown
    const currentTheme = resolvedTheme || "dark";
    const isDark = currentTheme === "dark";

    return (
        <motion.button
            onClick={() => setTheme(isDark ? "light" : "dark")}
            className="relative p-2 rounded-full bg-secondary/50 hover:bg-secondary text-foreground backdrop-blur-sm border border-border transition-colors"
            whileHover={{ scale: 1.1, rotate: 15 }}
            whileTap={{ scale: 0.9 }}
            aria-label="Toggle theme"
        >
            <motion.div
                initial={false}
                animate={{
                    scale: isDark ? 1 : 0,
                    opacity: isDark ? 1 : 0,
                    rotate: isDark ? 0 : 180,
                }}
                transition={{ duration: 0.3 }}
                className="absolute inset-0 flex items-center justify-center"
            >
                <span className="text-base">🌙</span>
            </motion.div>

            <motion.div
                initial={false}
                animate={{
                    scale: !isDark ? 1 : 0,
                    opacity: !isDark ? 1 : 0,
                    rotate: !isDark ? 0 : -180,
                }}
                transition={{ duration: 0.3 }}
                className="flex items-center justify-center"
            >
                <span className="text-base">☀️</span>
            </motion.div>
        </motion.button>
    );
}
