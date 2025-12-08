"use client";

import React from 'react';
import { motion } from 'framer-motion';
import SkillsGrid from '../SkillsGrid';
import { skills } from '@/data/skills';

const AboutSection = () => {
    return (
        <section id="about" className="py-24 bg-secondary/30">
            <div className="max-w-7xl mx-auto px-6">
                <div className="flex flex-col gap-16">
                    {/* Content */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                        className="w-full"
                    >
                        <h2 className="text-4xl md:text-5xl font-bold tracking-tight mb-8">
                            About Me
                        </h2>
                        <div className="prose dark:prose-invert max-w-none text-lg text-muted-foreground leading-relaxed space-y-6">
                            <p>
                                I&apos;m a Product Manager with 3+ years of experience, skilled in transforming legacy systems into scalable SaaS solutions.
                            </p>
                            <p>
                                I led cross-functional teams at LTIMindtree and Epitome Network, developing mobile platforms and KPI dashboards.
                                Recently graduated from Master of Information Systems Management at Carnegie Mellon University.
                            </p>
                        </div>
                    </motion.div>

                    {/* Skills */}
                    <motion.div
                        initial={{ opacity: 0, y: 20 }}
                        whileInView={{ opacity: 1, y: 0 }}
                        viewport={{ once: true }}
                    >
                        <h3 className="text-2xl font-bold mb-8">
                            Technical Skills
                        </h3>
                        <SkillsGrid skills={skills} />
                    </motion.div>
                </div>
            </div>
        </section>
    );
};

export default AboutSection;
