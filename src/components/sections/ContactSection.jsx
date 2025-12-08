"use client";

import React from 'react';
import { motion } from 'framer-motion';
import Button from '../ui/Button';
import Image from 'next/image';
// import { Mail } from 'lucide-react';

const ContactSection = () => {
    return (
        <section id="contact" className="py-24 min-h-[80vh] flex flex-col justify-center relative overflow-hidden">
            {/* Background Gradient */}
            <div className="absolute bottom-0 right-0 w-[800px] h-[800px] bg-primary/5 rounded-full blur-3xl -z-10" />

            <div className="max-w-4xl mx-auto px-6 w-full text-center">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                >
                    <h2 className="text-4xl md:text-6xl font-bold tracking-tight mb-8">
                        Let&apos;s work together.
                    </h2>
                    <p className="text-xl text-muted-foreground mb-12 max-w-2xl mx-auto">
                        I&apos;m always interested in hearing about new opportunities, projects, and collaborations.
                        Whether you have a question or just want to say hi, feel free to reach out.
                    </p>

                    <div className="flex flex-col items-center gap-8">
                        <Button href="mailto:anujyadav160@gmail.com" className="text-lg px-10 py-6">
                            <span className="mr-2">✉️</span> anujyadav160@gmail.com
                        </Button>

                        <div className="mt-8">
                            <p className="text-sm font-medium uppercase tracking-widest text-muted-foreground mb-6">
                                Connect with me
                            </p>
                            <div className="flex items-center justify-center gap-3">
                                <a
                                    href="https://www.linkedin.com/in/anujyadavs/"
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="flex items-center justify-center w-14 h-14 rounded-full border-2 border-foreground/20 hover:border-foreground transition-all duration-300 overflow-hidden"
                                    aria-label="LinkedIn"
                                >
                                    <Image
                                        src="/icons/linkedin-light.png"
                                        alt="LinkedIn"
                                        width={38}
                                        height={38}
                                        className="object-cover dark:hidden"
                                    />
                                    <Image
                                        src="/icons/linkedin-dark.png"
                                        alt="LinkedIn"
                                        width={38}
                                        height={38}
                                        className="object-cover hidden dark:block"
                                    />
                                </a>
                                <a
                                    href="https://github.com/anujyadav140"
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="flex items-center justify-center w-14 h-14 rounded-full border-2 border-foreground/20 hover:border-foreground transition-all duration-300 overflow-hidden"
                                    aria-label="GitHub"
                                >
                                    <Image
                                        src="/icons/github-light.png"
                                        alt="GitHub"
                                        width={40}
                                        height={40}
                                        className="object-contain dark:hidden"
                                    />
                                    <Image
                                        src="/icons/github-dark.png"
                                        alt="GitHub"
                                        width={40}
                                        height={40}
                                        className="object-contain hidden dark:block"
                                    />
                                </a>
                                <a
                                    href="https://www.youtube.com/@drexvo5544"
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    className="flex items-center justify-center w-14 h-14 rounded-full border-2 border-foreground/20 hover:border-foreground transition-all duration-300 overflow-hidden"
                                    aria-label="YouTube"
                                >
                                    <Image
                                        src="/icons/youtube-light.png"
                                        alt="YouTube"
                                        width={56}
                                        height={56}
                                        className="object-cover dark:hidden"
                                    />
                                    <Image
                                        src="/icons/youtube-dark.png"
                                        alt="YouTube"
                                        width={56}
                                        height={56}
                                        className="object-cover hidden dark:block"
                                    />
                                </a>
                            </div>
                        </div>
                    </div>
                </motion.div>
            </div>

            <div className="absolute bottom-8 left-0 right-0 text-center">
                <p className="text-sm text-muted-foreground">
                    © 2025 Anuj Yadav. Built with Next.js & Tailwind.
                </p>
            </div>
        </section>
    );
};

export default ContactSection;
