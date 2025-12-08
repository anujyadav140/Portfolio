"use client";

import React, { useState, useEffect } from 'react';
import Image from 'next/image';
import { motion, AnimatePresence } from 'framer-motion';
import { X, Github, Youtube, ChevronLeft, ChevronRight, FileText } from 'lucide-react';

const ProjectModal = ({ project, onClose }) => {
    const [currentSlide, setCurrentSlide] = useState(0);
    const [isAutoPlaying, setIsAutoPlaying] = useState(true);

    // Safety check
    if (!project) return null;

    // Ensure screenshots array exists
    const screenshots = project.screenshots || [project.imageUrl];
    const longDescription = project.longDescription || project.shortDescription || '';

    // Parse longDescription to convert em dashes to bullet points
    const parseDescription = (desc) => {
        return desc
            .split('\n')
            .filter(line => line.trim())
            .map(line => {
                if (line.trim().startsWith('—')) {
                    return { type: 'bullet', text: line.trim().substring(1).trim() };
                }
                return { type: 'text', text: line.trim() };
            });
    };

    const descriptionLines = parseDescription(longDescription);

    // Auto-play carousel
    useEffect(() => {
        if (!isAutoPlaying || screenshots.length <= 1) return;

        const interval = setInterval(() => {
            setCurrentSlide((prev) => (prev + 1) % screenshots.length);
        }, 3000);

        return () => clearInterval(interval);
    }, [isAutoPlaying, screenshots]);

    // ESC key to close
    useEffect(() => {
        const handleEsc = (e) => {
            if (e.key === 'Escape') onClose();
        };
        window.addEventListener('keydown', handleEsc);
        return () => window.removeEventListener('keydown', handleEsc);
    }, [onClose]);

    // Prevent body scroll when modal is open
    useEffect(() => {
        document.body.style.overflow = 'hidden';
        return () => {
            document.body.style.overflow = 'unset';
        };
    }, []);

    const nextSlide = () => {
        setCurrentSlide((prev) => (prev + 1) % screenshots.length);
        setIsAutoPlaying(false);
    };

    const prevSlide = () => {
        setCurrentSlide((prev) => (prev - 1 + screenshots.length) % screenshots.length);
        setIsAutoPlaying(false);
    };

    return (
        <AnimatePresence>
            <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                onClick={onClose}
                className="fixed inset-0 z-50 flex items-center justify-center md:p-4 bg-black/80 backdrop-blur-sm"
            >
                <motion.div
                    initial={{ scale: 0.9, opacity: 0 }}
                    animate={{ scale: 1, opacity: 1 }}
                    exit={{ scale: 0.9, opacity: 0 }}
                    transition={{ type: 'spring', damping: 25, stiffness: 300 }}
                    onClick={(e) => e.stopPropagation()}
                    className="relative w-full h-full md:max-w-7xl md:max-h-[90vh] md:h-auto bg-white dark:bg-secondary md:rounded-2xl shadow-2xl overflow-hidden"
                >
                    {/* Close button */}
                    <button
                        onClick={onClose}
                        className="absolute top-4 right-4 z-10 p-2 rounded-full bg-black/50 hover:bg-black/70 text-white transition-colors"
                        aria-label="Close modal"
                    >
                        <X size={24} />
                    </button>

                    <div className="flex flex-col md:flex-row h-full overflow-y-auto md:overflow-hidden">
                        {/* Left side - Carousel */}
                        <div className="md:w-[45%] bg-secondary dark:bg-secondary p-2 md:p-4 flex flex-col justify-center items-center relative md:min-h-0 shrink-0">
                            <div className="relative w-full h-[70vh] md:h-auto md:aspect-video md:max-h-[700px] rounded-lg overflow-hidden flex items-center justify-center bg-secondary">
                                <AnimatePresence mode="wait">
                                    <motion.div
                                        key={currentSlide}
                                        initial={{ opacity: 0, x: 100 }}
                                        animate={{ opacity: 1, x: 0 }}
                                        exit={{ opacity: 0, x: -100 }}
                                        transition={{ duration: 0.3 }}
                                        className="absolute inset-0"
                                        drag="x"
                                        dragConstraints={{ left: 0, right: 0 }}
                                        dragElastic={0.2}
                                        onDragEnd={(e, { offset, velocity }) => {
                                            const swipe = Math.abs(offset.x) * velocity.x;

                                            if (swipe < -10000) {
                                                // Swiped left, go to next
                                                nextSlide();
                                            } else if (swipe > 10000) {
                                                // Swiped right, go to previous
                                                prevSlide();
                                            }
                                        }}
                                    >
                                        <Image
                                            src={screenshots[currentSlide]}
                                            alt={`${project.name} screenshot ${currentSlide + 1}`}
                                            fill
                                            className="object-contain pointer-events-none"
                                        />
                                    </motion.div>
                                </AnimatePresence>

                                {/* Navigation arrows */}
                                {screenshots.length > 1 && (
                                    <>
                                        <button
                                            onClick={prevSlide}
                                            className="absolute left-2 top-1/2 -translate-y-1/2 p-2 rounded-full bg-black/50 hover:bg-black/70 text-white transition-colors"
                                            aria-label="Previous slide"
                                        >
                                            <ChevronLeft size={24} />
                                        </button>
                                        <button
                                            onClick={nextSlide}
                                            className="absolute right-2 top-1/2 -translate-y-1/2 p-2 rounded-full bg-black/50 hover:bg-black/70 text-white transition-colors"
                                            aria-label="Next slide"
                                        >
                                            <ChevronRight size={24} />
                                        </button>
                                    </>
                                )}
                            </div>

                            {/* Dots indicator */}
                            {screenshots.length > 1 && (
                                <div className="flex gap-2 mt-4">
                                    {screenshots.map((_, index) => (
                                        <button
                                            key={index}
                                            onClick={() => {
                                                setCurrentSlide(index);
                                                setIsAutoPlaying(false);
                                            }}
                                            className={`h-2 rounded-full transition-all ${index === currentSlide
                                                ? 'w-8 bg-slate-400 dark:bg-slate-500'
                                                : 'w-2 bg-slate-400 dark:bg-slate-600'
                                                }`}
                                            aria-label={`Go to slide ${index + 1}`}
                                        />
                                    ))}
                                </div>
                            )}
                        </div>

                        {/* Right side - Details */}
                        <div className="md:w-[55%] p-6 md:p-8 md:overflow-y-auto shrink-0">
                            {/* Project title */}
                            <h2 className="text-2xl md:text-3xl font-bold mb-4">{project.name}</h2>

                            {/* Short description */}
                            <p className="text-lg text-muted-foreground mb-6">
                                {project.shortDescription}
                            </p>

                            {/* Detailed description */}
                            <div className="mb-6 space-y-2">
                                <h3 className="text-xl font-semibold mb-3">Project Details</h3>
                                {descriptionLines.map((line, index) => (
                                    <div key={index} className="flex gap-2 items-baseline">
                                        {line.type === 'bullet' && (
                                            <span className="text-secondary-foreground flex-shrink-0">•</span>
                                        )}
                                        <p className="text-sm leading-relaxed flex-1">{line.text}</p>
                                    </div>
                                ))}
                            </div>

                            {/* Technologies */}
                            <div className="mb-6">
                                <h3 className="text-xl font-semibold mb-3">Technologies Used</h3>
                                <div className="flex flex-wrap gap-2">
                                    {project.technologies.map((tech) => (
                                        <span
                                            key={tech}
                                            className="px-3 py-1 text-sm font-medium rounded-md bg-secondary text-secondary-foreground border border-secondary-foreground/10"
                                        >
                                            {tech}
                                        </span>
                                    ))}
                                </div>
                            </div>

                            {/* Action buttons */}
                            <div className="flex flex-wrap gap-3">
                                {project.caseStudyUrl && (
                                    <a
                                        href={project.caseStudyUrl}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="flex items-center gap-2 px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                                    >
                                        <FileText size={20} />
                                        Case Study
                                    </a>
                                )}
                                {project.projectUrl && (
                                    <a
                                        href={project.projectUrl}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="flex items-center gap-2 px-6 py-3 bg-secondary text-secondary-foreground border border-secondary-foreground/10 rounded-lg hover:bg-secondary/80 transition-colors"
                                    >
                                        <Github size={20} />
                                        View Code
                                    </a>
                                )}
                                {project.videoId && (
                                    <a
                                        href={`https://www.youtube.com/watch?v=${project.videoId}`}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="flex items-center gap-2 px-6 py-3 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
                                    >
                                        <Youtube size={20} />
                                        Watch Demo
                                    </a>
                                )}
                            </div>
                        </div>
                    </div>
                </motion.div>
            </motion.div>
        </AnimatePresence>
    );
};

export default ProjectModal;
