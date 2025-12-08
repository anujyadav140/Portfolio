"use client";

import React from 'react';
// import { Github, Linkedin, Youtube, Mail } from 'lucide-react';
import { motion } from 'framer-motion';

const SocialLinks = ({ className = '' }) => {
    const links = [
        { name: 'GitHub', href: 'https://github.com/anujyadav140', icon: "GH" },
        { name: 'LinkedIn', href: 'https://linkedin.com/in/anuj-yadav', icon: "LI" },
        { name: 'YouTube', href: 'https://youtube.com', icon: "YT" },
        { name: 'Email', href: 'mailto:anujyadav160@gmail.com', icon: "@" },
    ];

    return (
        <div className={`flex gap-4 ${className}`}>
            {links.map((link, index) => (
                <motion.a
                    key={link.name}
                    href={link.href}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="
            flex items-center justify-center
            w-12 h-12
            rounded-full
            bg-white/5 dark:bg-white/5
            backdrop-blur-sm
            border border-white/10 dark:border-white/5
            text-muted-foreground
            hover:text-primary hover:bg-primary/10 hover:border-primary/20
            transition-colors
            font-bold text-sm
          "
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: index * 0.1 }}
                    whileHover={{ y: -5, scale: 1.1 }}
                    whileTap={{ scale: 0.95 }}
                    aria-label={link.name}
                >
                    {link.icon}
                </motion.a>
            ))}
        </div>
    );
};

export default SocialLinks;
