"use client";

import React, { useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, ChevronRight, Briefcase, FolderGit2 } from 'lucide-react';
import Image from 'next/image';
import { projects } from '@/data/projects';

import ExperienceModal from './ExperienceModal';
import ProjectModal from './ProjectModal';

const SkillModal = ({ skill, onClose }) => {
    // State for experience details
    const [selectedExperience, setSelectedExperience] = React.useState(null);
    // State for project modal
    const [selectedProject, setSelectedProject] = React.useState(null);

    // Filter projects that have this skill
    const relatedProjects = projects.filter(project =>
        project.productSkills?.includes(skill?.label)
    );

    // Reset selected experience/project when skill changes (modal closes/opens)
    useEffect(() => {
        if (!skill) {
            setSelectedExperience(null);
            setSelectedProject(null);
            document.body.style.overflow = 'auto'; // Restore scroll
        } else {
            document.body.style.overflow = 'hidden'; // Lock scroll
        }
        return () => {
            document.body.style.overflow = 'auto'; // Cleanup
        };
    }, [skill]);

    // ESC key to close
    useEffect(() => {
        const handleEsc = (e) => {
            if (e.key === 'Escape') {
                if (selectedProject) {
                    setSelectedProject(null);
                } else if (selectedExperience) {
                    setSelectedExperience(null);
                } else {
                    onClose();
                }
            }
        };
        window.addEventListener('keydown', handleEsc);
        return () => window.removeEventListener('keydown', handleEsc);
    }, [onClose, selectedExperience, selectedProject]);

    if (!skill) return null;

    return (
        <AnimatePresence>
            <motion.div
                key="skill-modal-content"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                onClick={onClose}
                className="fixed inset-0 z-[60] flex items-center justify-end md:p-0 bg-black/60"
            >
                <motion.div
                    initial={{ x: '100%' }}
                    animate={{ x: 0 }}
                    exit={{ x: '100%' }}
                    transition={{ type: 'spring', damping: 25, stiffness: 500 }}
                    onClick={(e) => e.stopPropagation()}
                    className="w-full md:w-[500px] h-full bg-background border-l border-border shadow-2xl overflow-hidden relative"
                >
                    <AnimatePresence mode="wait">
                        {selectedProject ? (
                            <motion.div
                                key="project-panel"
                                initial={{ x: '100%', opacity: 0 }}
                                animate={{ x: 0, opacity: 1 }}
                                exit={{ x: '100%', opacity: 0 }}
                                transition={{ type: 'spring', damping: 20, stiffness: 600 }}
                                className="absolute inset-0 z-20 bg-background h-full overflow-y-auto"
                            >
                                <ProjectModal
                                    project={selectedProject}
                                    isPanel={true}
                                    onBack={() => setSelectedProject(null)}
                                    onClose={() => setSelectedProject(null)}
                                />
                            </motion.div>
                        ) : selectedExperience ? (
                            <motion.div
                                key="experience"
                                initial={{ x: '100%', opacity: 0 }}
                                animate={{ x: 0, opacity: 1 }}
                                exit={{ x: '100%', opacity: 0 }}
                                transition={{ type: 'spring', damping: 25, stiffness: 500 }}
                                className="absolute inset-0 z-10 bg-background h-full"
                            >
                                <ExperienceModal
                                    experience={selectedExperience}
                                    onBack={() => setSelectedExperience(null)}
                                />
                            </motion.div>
                        ) : (
                            <motion.div
                                key="list"
                                initial={{ x: '-20%', opacity: 0 }}
                                animate={{ x: 0, opacity: 1 }}
                                exit={{ x: '-20%', opacity: 0 }}
                                transition={{ type: 'spring', damping: 25, stiffness: 500 }}
                                className="h-full overflow-y-auto"
                            >
                                <div className="p-6 md:p-8 space-y-8">
                                    {/* Header */}
                                    <div className="flex justify-between items-start">
                                        <div className="flex items-center gap-4">
                                            <span className="flex items-center justify-center w-12 h-12 text-2xl bg-secondary rounded-xl border border-border/50">
                                                {skill.icon}
                                            </span>
                                            <div>
                                                <h2 className="text-2xl font-bold text-foreground">{skill.label}</h2>
                                                <p className="text-sm text-muted-foreground font-medium">Key Competency</p>
                                            </div>
                                        </div>
                                        <button
                                            onClick={onClose}
                                            className="p-2 rounded-full hover:bg-secondary text-muted-foreground hover:text-foreground transition-colors"
                                        >
                                            <X size={20} />
                                        </button>
                                    </div>

                                    {/* Description */}
                                    <div className="p-4 rounded-xl bg-secondary/30 border border-border/50">
                                        <p className="text-base leading-relaxed text-foreground/90">
                                            {skill.description}
                                        </p>
                                    </div>

                                    {/* Related Experience */}
                                    {skill.relatedExperience && skill.relatedExperience.length > 0 && (
                                        <div className="space-y-4">
                                            <div className="flex items-center gap-2 text-blue-600 dark:text-blue-400">
                                                <Briefcase size={20} />
                                                <h3 className="font-semibold text-lg">Related Experience</h3>
                                                <span className="text-xs px-2 py-0.5 rounded-full bg-blue-100 dark:bg-blue-900/30 text-blue-700 dark:text-blue-300 font-medium">
                                                    {skill.relatedExperience.length}
                                                </span>
                                            </div>
                                            <div className="grid gap-3">
                                                {skill.relatedExperience.map((exp, index) => (
                                                    <div
                                                        key={index}
                                                        onClick={() => setSelectedExperience(exp)}
                                                        className="p-4 rounded-xl bg-secondary border border-border flex items-center justify-between group cursor-pointer hover:border-blue-500/50 hover:bg-secondary/80 transition-all"
                                                    >
                                                        <div className="flex items-center gap-4">
                                                            <div className="w-12 h-12 rounded-lg bg-black/5 dark:bg-white/5 flex items-center justify-center shrink-0">
                                                                <Briefcase size={20} className="text-muted-foreground" />
                                                            </div>
                                                            <div>
                                                                <h4 className="font-semibold text-foreground text-base group-hover:text-blue-500 transition-colors">{exp.role}</h4>
                                                                <p className="text-sm text-muted-foreground">{exp.company}</p>
                                                                {exp.location && (
                                                                    <p className="text-xs text-muted-foreground/70 mt-0.5">{exp.location}</p>
                                                                )}
                                                            </div>
                                                        </div>
                                                        <ChevronRight className="text-muted-foreground/50 group-hover:text-blue-500 group-hover:opacity-100 transition-all" size={20} />
                                                    </div>
                                                ))}
                                            </div>
                                        </div>
                                    )}

                                    {/* Related Projects */}
                                    {relatedProjects.length > 0 && (
                                        <div className="space-y-4">
                                            <div className="flex items-center gap-2 text-emerald-600 dark:text-emerald-400">
                                                <FolderGit2 size={20} />
                                                <h3 className="font-semibold text-lg">Related Projects</h3>
                                                <span className="text-xs px-2 py-0.5 rounded-full bg-emerald-100 dark:bg-emerald-900/30 text-emerald-700 dark:text-emerald-300 font-medium">
                                                    {relatedProjects.length}
                                                </span>
                                            </div>
                                            <div className="grid gap-3">
                                                {relatedProjects.map((project, index) => (
                                                    <button
                                                        key={index}
                                                        onClick={() => setSelectedProject(project)}
                                                        className="w-full group flex items-center justify-between gap-4 p-3 rounded-xl bg-secondary border border-border hover:border-emerald-500/30 hover:bg-secondary/80 transition-all text-left"
                                                    >
                                                        <div className="flex items-center gap-4 flex-1 min-w-0">
                                                            <div className="relative w-16 h-16 rounded-lg overflow-hidden flex-shrink-0 border border-border/50">
                                                                <Image
                                                                    src={project.imageUrl}
                                                                    alt={project.name}
                                                                    fill
                                                                    className="object-cover transition-transform duration-500 group-hover:scale-110"
                                                                />
                                                            </div>
                                                            <div className="flex-1 min-w-0">
                                                                <h4 className="font-semibold text-foreground truncate group-hover:text-emerald-600 dark:group-hover:text-emerald-400 transition-colors mb-1">
                                                                    {project.name}
                                                                </h4>
                                                                <p className="text-xs text-muted-foreground line-clamp-2">
                                                                    {project.shortDescription}
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <ChevronRight size={16} className="text-muted-foreground opacity-0 -translate-x-2 group-hover:opacity-100 group-hover:translate-x-0 transition-all shrink-0" />
                                                    </button>
                                                ))}
                                            </div>
                                        </div>
                                    )}
                                </div>
                            </motion.div>
                        )}
                    </AnimatePresence>
                </motion.div>
            </motion.div>

        </AnimatePresence>
    );
};

export default SkillModal;
