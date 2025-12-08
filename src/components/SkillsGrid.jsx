"use client";

import React from 'react';
import Image from 'next/image';
import { motion } from 'framer-motion';

const SkillsGrid = ({ skills }) => {
    const container = {
        hidden: { opacity: 0 },
        show: {
            opacity: 1,
            transition: {
                staggerChildren: 0.05
            }
        }
    };

    const item = {
        hidden: { opacity: 0, scale: 0.8 },
        show: { opacity: 1, scale: 1 }
    };

    return (
        <motion.div
            variants={container}
            initial="hidden"
            whileInView="show"
            viewport={{ once: true }}
            className="grid grid-cols-5 sm:grid-cols-6 md:grid-cols-6 lg:grid-cols-8 gap-4"
        >
            {skills.map((skill) => (
                <motion.div
                    key={skill.name}
                    variants={item}
                    whileHover={{ y: -5, scale: 1.05 }}
                    className="
            flex flex-col items-center justify-center p-2.5
            rounded-xl
            bg-white dark:bg-slate-900
            border border-slate-200 dark:border-slate-800
            shadow-sm hover:shadow-md hover:border-primary/20
            transition-colors
            group
          "
                >
                    <div className="relative w-7 h-7 mb-2 grayscale group-hover:grayscale-0 transition-all duration-300">
                        <Image
                            src={skill.icon}
                            alt={skill.name}
                            fill
                            className="object-contain"
                        />
                    </div>
                    <span className="text-[0.65rem] font-medium text-muted-foreground group-hover:text-foreground text-center">
                        {skill.name}
                    </span>
                </motion.div>
            ))}
        </motion.div>
    );
};

export default SkillsGrid;
