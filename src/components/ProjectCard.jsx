"use client";

import React from 'react';
import Image from 'next/image';
import { motion } from 'framer-motion';
import { Github, Youtube, FileText } from 'lucide-react';
import { cn } from '@/lib/utils';

const ProjectCard = ({ project, index, onClick }) => {
    return (
        <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: index * 0.1 }}
            onClick={onClick}
            className="group relative rounded-2xl overflow-hidden bg-white dark:bg-secondary border border-slate-200 dark:border-slate-800 shadow-sm hover:shadow-xl hover:shadow-primary/5 transition-all duration-500 cursor-pointer"
        >
            {/* Image Container */}
            <div className="relative aspect-video overflow-hidden bg-slate-100 dark:bg-slate-800">
                <Image
                    src={project.imageUrl}
                    alt={project.name}
                    fill
                    className="object-cover transition-transform duration-700 group-hover:scale-105"
                />

                {/* Overlay */}
                <div className="absolute inset-0 bg-black/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center gap-4 backdrop-blur-[2px]">
                    {project.caseStudyUrl && (
                        <a
                            href={project.caseStudyUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="p-3 rounded-full bg-blue-600 text-white hover:scale-110 transition-transform font-bold text-xs"
                            title="View Case Study"
                            onClick={(e) => e.stopPropagation()}
                        >
                            <FileText size={20} />
                        </a>
                    )}
                    {project.projectUrl && (
                        <a
                            href={project.projectUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="flex items-center gap-2 px-4 py-2 rounded-full bg-white text-black hover:scale-110 transition-transform font-bold text-xs"
                            title="Visit Project"
                            onClick={(e) => e.stopPropagation()}
                        >
                            <Github size={20} />
                            <span>Github Link</span>
                        </a>
                    )}
                    {project.videoId && (
                        <a
                            href={`https://www.youtube.com/watch?v=${project.videoId}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="p-3 rounded-full bg-red-600 text-white hover:scale-110 transition-transform font-bold text-xs"
                            title="Watch Demo"
                            onClick={(e) => e.stopPropagation()}
                        >
                            <Youtube size={20} />
                        </a>
                    )}
                </div>
            </div>

            {/* Content */}
            <div className="p-6">
                <div className="flex justify-between items-start mb-4">
                    <div>
                        <h3 className="text-xl font-bold mb-1 group-hover:text-primary transition-colors">
                            {project.name}
                        </h3>
                        <p className="text-sm text-muted-foreground line-clamp-2">
                            {project.shortDescription}
                        </p>
                    </div>
                    <div className="flex gap-2 ml-4 shrink-0">
                        {project.caseStudyUrl && (
                            <a
                                href={project.caseStudyUrl}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-muted-foreground hover:text-blue-600 transition-colors"
                                title="View Case Study"
                                onClick={(e) => e.stopPropagation()}
                            >
                                <FileText size={20} />
                            </a>
                        )}
                        {project.projectUrl && (
                            <a
                                href={project.projectUrl}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-muted-foreground hover:text-primary transition-colors"
                                title="View Code"
                            >
                                <Github size={20} />
                            </a>
                        )}
                        {project.videoId && (
                            <a
                                href={`https://www.youtube.com/watch?v=${project.videoId}`}
                                target="_blank"
                                rel="noopener noreferrer"
                                className="text-muted-foreground hover:text-red-600 transition-colors"
                                title="Watch Demo"
                            >
                                <Youtube size={20} />
                            </a>
                        )}
                    </div>
                </div>

                {/* Tech Stack */}
                <div className="flex flex-wrap gap-2 mt-4">
                    {project.technologies.slice(0, 4).map((tech) => (
                        <span
                            key={tech}
                            className="px-2 py-1 text-xs font-medium rounded-md bg-secondary text-secondary-foreground border border-secondary-foreground/10"
                        >
                            {tech}
                        </span>
                    ))}
                </div>
            </div>
        </motion.div>
    );
};

export default ProjectCard;
