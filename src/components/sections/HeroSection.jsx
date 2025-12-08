"use client";

import React from 'react';
import { motion } from 'framer-motion';
import { useTheme } from 'next-themes';
import Button from '../ui/Button';
import Image from 'next/image';

const HeroSection = () => {
    const { theme } = useTheme();
    const [mounted, setMounted] = React.useState(false);

    React.useEffect(() => {
        setMounted(true);
    }, []);

    return (
        <section id="hero" className="min-h-screen flex items-center justify-center relative overflow-hidden pt-28 md:pt-36">
            {/* Background Elements - Removed gradient blob */}

            <div className="max-w-7xl mx-auto px-6 w-full text-center">
                <motion.h1
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.5 }}
                    className="text-5xl md:text-7xl font-bold tracking-tight mb-4"
                >
                    Hello, I&apos;m <br />
                    <span className="text-foreground">
                        Anuj Yadav
                    </span>
                </motion.h1>

                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.5, delay: 0.1 }}
                >
                    <span className="inline-block px-4 py-1.5 mb-6 text-sm font-medium rounded-full bg-secondary text-secondary-foreground border border-secondary-foreground/10">
                        Product Manager & Builder
                    </span>
                </motion.div>

                <motion.p
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.5, delay: 0.2 }}
                    className="text-lg md:text-xl text-muted-foreground max-w-2xl mx-auto mb-8 leading-relaxed"
                >
                    User-focused problem solver with strong technical skills and a keen design sense.
                </motion.p>

                {/* Social Links & Resume */}
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.5, delay: 0.3 }}
                    className="flex items-center justify-center gap-3 mb-8"
                >
                    <a
                        href="https://www.linkedin.com/in/anujyadavs/"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center justify-center w-14 h-14 rounded-full border-2 border-foreground/20 hover:border-foreground transition-all duration-300 overflow-hidden"
                        aria-label="LinkedIn"
                    >
                        {mounted && (
                            <Image
                                src={theme === 'dark' ? '/icons/linkedin-dark.png' : '/icons/linkedin-light.png'}
                                alt="LinkedIn"
                                width={38}
                                height={38}
                                className="object-cover"
                            />
                        )}
                    </a>
                    <a
                        href="https://github.com/anujyadav140"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center justify-center w-14 h-14 rounded-full border-2 border-foreground/20 hover:border-foreground transition-all duration-300 overflow-hidden"
                        aria-label="GitHub"
                    >
                        {mounted && (
                            <Image
                                src={theme === 'dark' ? '/icons/github-dark.png' : '/icons/github-light.png'}
                                alt="GitHub"
                                width={40}
                                height={40}
                                className="object-contain"
                            />
                        )}
                    </a>
                    <a
                        href="https://www.youtube.com/@drexvo5544"
                        target="_blank"
                        rel="noopener noreferrer"
                        className="flex items-center justify-center w-14 h-14 rounded-full border-2 border-foreground/20 hover:border-foreground transition-all duration-300 overflow-hidden"
                        aria-label="YouTube"
                    >
                        {mounted && (
                            <Image
                                src={theme === 'dark' ? '/icons/youtube-dark.png' : '/icons/youtube-light.png'}
                                alt="YouTube"
                                width={56}
                                height={56}
                                className="object-cover"
                            />
                        )}
                    </a>
                    <div className="w-px h-6 bg-border mx-1" />
                    <a
                        href="https://drive.google.com/file/d/1Ka9GbdJCF29GG5Of1GiQhL0bSP9eZfWL/view?usp=sharing"
                        rel="noopener noreferrer"
                        className="px-5 py-2.5 rounded-full border-2 border-foreground/20 hover:border-foreground hover:bg-foreground hover:text-background transition-all duration-300 font-medium text-base"
                    >
                        Resume
                    </a>
                </motion.div>

                {/* View Work & Contact Buttons */}
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.5, delay: 0.4 }}
                    className="flex flex-col sm:flex-row items-center justify-center gap-4 mb-12"
                >
                    <Button href="#work" variant="primary">
                        View Work <span>→</span>
                    </Button>
                    <Button href="#contact" variant="secondary">
                        Contact Me
                    </Button>
                </motion.div>

                {/* Key Skills */}
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.5, delay: 0.5 }}
                    className="w-full mb-8 text-left px-8"
                >
                    <h3 className="text-xl md:text-2xl font-bold text-foreground mb-8">Key Skills</h3>
                    <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-3">
                        {[
                            { icon: '📋', label: 'Product Strategy' },
                            { icon: '📄', label: 'PRDs & Requirements' },
                            { icon: '🗺️', label: 'Roadmapping & Prioritization' },
                            { icon: '🤖', label: 'RAG / LLM & Agentic AI' },
                            { icon: '📊', label: 'Big Data / Data Engineering' },
                            { icon: '🗄️', label: 'SQL & Databases' },
                            { icon: '🎨', label: 'UX & Prototyping (Figma)' },
                            { icon: '🤝', label: 'Cross-functional Leadership' },
                            { icon: '💻', label: 'Full-stack Software Engineering' },
                            { icon: '📈', label: 'Data Analytics & Dashboards' },
                        ].map((skill, index) => (
                            <motion.div
                                key={index}
                                whileHover={{ scale: 1.05 }}
                                whileTap={{ scale: 0.95 }}
                                className="group relative flex items-center gap-2 px-3 py-2.5 rounded-full bg-secondary text-secondary-foreground border border-secondary-foreground/10 hover:bg-secondary/80 transition-colors duration-300 justify-start overflow-hidden cursor-pointer"
                            >
                                <span className="absolute w-0 h-0 transition-all duration-500 ease-out bg-white rounded-full group-hover:w-56 group-hover:h-56 opacity-10 left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2"></span>
                                <span className="relative z-10 text-lg flex-shrink-0">{skill.icon}</span>
                                <span className="relative z-10 text-xs sm:text-sm font-medium text-foreground/90 leading-tight">{skill.label}</span>
                            </motion.div>
                        ))}
                    </div>
                </motion.div>
            </div>
        </section>
    );
};

export default HeroSection;
