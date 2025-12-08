"use client";

import React from 'react';
import { motion } from 'framer-motion';
import ProjectCard from '../ProjectCard';
import ProjectModal from '../ProjectModal';
import { projects } from '@/data/projects';

const WorkSection = () => {
    const [visibleCount, setVisibleCount] = React.useState(3);
    const [selectedProject, setSelectedProject] = React.useState(null);
    const visibleProjects = projects.slice(0, visibleCount);

    const handleShowMore = () => {
        setVisibleCount((prev) => Math.min(prev + 3, projects.length));
    };

    const handleShowLess = () => {
        setVisibleCount(3);
    };

    return (
        <section id="work" className="py-24 relative">
            <div className="max-w-7xl mx-auto px-6">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    className="mb-16"
                >
                    <h2 className="text-4xl md:text-5xl font-bold tracking-tight mb-4">
                        Selected Work
                    </h2>
                    <p className="text-xl text-muted-foreground max-w-full">
                        A selection of projects that showcase my skills in product management and development.
                    </p>
                </motion.div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
                    {visibleProjects.map((project, index) => (
                        <ProjectCard
                            key={project.name}
                            project={project}
                            index={index}
                            onClick={() => setSelectedProject(project)}
                        />
                    ))}
                </div>

                {/* Show More / Show Less Buttons */}
                <div className="flex justify-center">
                    {visibleCount < projects.length ? (
                        <motion.button
                            whileHover={{ scale: 1.05 }}
                            whileTap={{ scale: 0.95 }}
                            onClick={handleShowMore}
                            className="group relative px-8 py-3 rounded-full bg-foreground text-background font-medium text-lg overflow-hidden shadow-lg hover:shadow-xl transition-all duration-300"
                        >
                            <span className="relative z-10 flex items-center gap-2">
                                Show More Projects
                                <svg
                                    className="w-5 h-5 transition-transform duration-300 group-hover:translate-y-1"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                >
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                                </svg>
                            </span>
                            <div className="absolute inset-0 bg-white/20 translate-y-full group-hover:translate-y-0 transition-transform duration-300" />
                        </motion.button>
                    ) : visibleCount > 3 && (
                        <motion.button
                            whileHover={{ scale: 1.05 }}
                            whileTap={{ scale: 0.95 }}
                            onClick={handleShowLess}
                            className="group relative px-8 py-3 rounded-full border-2 border-foreground text-foreground font-medium text-lg overflow-hidden hover:bg-foreground hover:text-background transition-all duration-300"
                        >
                            <span className="relative z-10 flex items-center gap-2">
                                Show Less
                                <svg
                                    className="w-5 h-5 transition-transform duration-300 group-hover:-translate-y-1"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                >
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 15l7-7 7 7" />
                                </svg>
                            </span>
                        </motion.button>
                    )}
                </div>
            </div>

            {/* Project Modal */}
            {selectedProject && (
                <ProjectModal
                    project={selectedProject}
                    onClose={() => setSelectedProject(null)}
                />
            )}
        </section>
    );
};

export default WorkSection;
