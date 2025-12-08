"use client";

import React from 'react';
import { motion } from 'framer-motion';
import { cn } from '@/lib/utils';

const Button = ({ children, onClick, href, className = '', variant = 'primary', ...props }) => {
    const baseClasses = cn(
        "relative inline-flex items-center justify-center px-8 py-3 overflow-hidden font-medium transition-all rounded-full group",
        variant === 'primary'
            ? "bg-primary text-primary-foreground shadow-lg shadow-primary/25 hover:shadow-xl hover:shadow-primary/40"
            : "bg-secondary text-secondary-foreground border border-secondary-foreground/10 hover:bg-secondary/80",
        className
    );

    const content = (
        <>
            <span className="absolute w-0 h-0 transition-all duration-500 ease-out bg-white rounded-full group-hover:w-56 group-hover:h-56 opacity-10"></span>
            <span className="relative flex items-center gap-2">{children}</span>
        </>
    );

    if (href) {
        return (
            <motion.a
                href={href}
                className={baseClasses}
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                {...props}
            >
                {content}
            </motion.a>
        );
    }

    return (
        <motion.button
            onClick={onClick}
            className={baseClasses}
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            {...props}
        >
            {content}
        </motion.button>
    );
};

export default Button;
