"use client";

import React, { useState, useEffect } from 'react';
import Image from 'next/image';
import { motion, AnimatePresence } from 'framer-motion';
import { X, Github, Youtube, ChevronLeft, ChevronRight, FileText } from 'lucide-react';

const ProjectModal = ({ project, onClose, isPanel = false, onBack }) => {
    const [currentSlide, setCurrentSlide] = useState(0);
    const [isAutoPlaying, setIsAutoPlaying] = useState(true);

    // Safety check
    if (!project) return null;

    // Ensure screenshots array exists and filter out invalid sources
    const screenshots = (project.screenshots || [project.imageUrl])
        .filter(src => src && src.trim() !== '');

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

    // ESC key to close (only if not in panel mode, or let parent handle)
    useEffect(() => {
        if (isPanel) return; // Parent handles ESC in panel mode
        const handleEsc = (e) => {
            if (e.key === 'Escape') onClose();
        };
        window.addEventListener('keydown', handleEsc);
        return () => window.removeEventListener('keydown', handleEsc);
    }, [onClose, isPanel]);

    // Prevent body scroll when modal is open (only in modal mode)
    useEffect(() => {
        if (isPanel) return;
        document.body.style.overflow = 'hidden';
        return () => {
            document.body.style.overflow = 'unset';
        };
    }, [isPanel]);

    const nextSlide = () => {
        if (screenshots.length === 0) return;
        setCurrentSlide((prev) => (prev + 1) % screenshots.length);
        setIsAutoPlaying(false);
    };

    const prevSlide = () => {
        if (screenshots.length === 0) return;
        setCurrentSlide((prev) => (prev - 1 + screenshots.length) % screenshots.length);
        setIsAutoPlaying(false);
    };

    const Content = (
        <div className={`flex flex-col ${isPanel ? 'h-full' : 'md:flex-row h-full overflow-y-auto md:overflow-hidden'}`}>

            {/* Panel Header (Back Button) */}
            {isPanel && (
                <div className="flex items-center gap-2 p-4 border-b border-border bg-background/50 backdrop-blur-sm sticky top-0 z-20">
                    <button
                        onClick={onBack}
                        className="p-2 -ml-2 rounded-full hover:bg-secondary transition-colors text-muted-foreground hover:text-foreground"
                    >
                        <ChevronLeft size={20} />
                    </button>
                    <span className="font-semibold text-foreground">Back to Skills</span>
                </div>
            )}

            {/* Left side - Carousel */}
            <div className={`${isPanel ? 'w-full shrink-0' : 'md:w-[45%] md:min-h-0 shrink-0'} bg-secondary dark:bg-secondary p-2 md:p-6 flex flex-col justify-center items-center relative`}>
                <div className={`relative w-full ${isPanel ? 'aspect-video max-h-[300px]' : 'h-[45vh] ' + (project.isLandscape ? 'md:h-auto md:aspect-video md:max-h-[450px]' : 'md:h-[65vh]')} rounded-lg overflow-hidden flex items-center justify-center bg-secondary`}>

                    {screenshots.length > 0 ? (
                        <>
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
                                            nextSlide();
                                        } else if (swipe > 10000) {
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
                        </>
                    ) : (
                        <div className="flex flex-col items-center justify-center text-muted-foreground p-4 text-center">
                            <span className="text-4xl mb-2">🖼️</span>
                            <p>No preview available</p>
                        </div>
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
            <div className={`${isPanel ? 'w-full overflow-y-auto pb-20' : 'md:w-[55%] md:overflow-y-auto'} p-6 md:p-8 shrink-0`}>
                {/* Project title */}
                <h2 className="text-2xl md:text-4xl font-bold mb-4">{project.name}</h2>

                {/* Short description */}
                <p className="text-base md:text-xl text-gray-700 dark:text-gray-300 mb-6 font-medium">
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
                            <p className="text-xs md:text-base leading-relaxed flex-1 text-gray-800 dark:text-gray-200">{line.text}</p>
                        </div>
                    ))}
                </div>

                {/* Technologies */}
                {project.technologies && (
                    <div className="mb-8">
                        <h3 className="text-xl font-semibold mb-3">Technologies</h3>
                        <div className="flex flex-wrap gap-2">
                            {project.technologies.map((tech) => (
                                <span
                                    key={tech}
                                    className="px-3 py-1 rounded-full bg-secondary text-secondary-foreground text-sm font-medium"
                                >
                                    {tech}
                                </span>
                            ))}
                        </div>
                    </div>
                )}

                {/* Links */}
                <div className="flex flex-wrap gap-4 mt-auto">
                    {project.projectUrl && (
                        <a
                            href={project.projectUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="flex items-center gap-2 px-6 py-3 rounded-full bg-foreground text-background font-medium hover:opacity-90 transition-opacity"
                        >
                            <Github size={20} />
                            View Source
                        </a>
                    )}
                    {project.caseStudyUrl && (
                        <a
                            href={project.caseStudyUrl}
                            target="_blank"
                            rel="noopener noreferrer"
                            className={`flex items-center gap-2 px-6 py-3 rounded-full font-medium transition-all ${!project.projectUrl
                                ? 'bg-foreground text-background hover:opacity-90'
                                : 'border-2 border-foreground text-foreground hover:bg-foreground hover:text-background'
                                }`}
                        >
                            <FileText size={20} />
                            View Case Study
                        </a>
                    )}
                    {project.videoId && (
                        <a
                            href={`https://www.youtube.com/watch?v=${project.videoId}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="flex items-center gap-2 px-6 py-3 rounded-full border-2 border-red-600 text-red-600 font-medium hover:bg-red-600 hover:text-white transition-all"
                        >
                            <Youtube size={20} />
                            Watch Demo
                        </a>
                    )}
                </div>
            </div>
        </div>
    );

    if (isPanel) {
        return Content;
    }

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
                    className="relative w-full h-full md:max-w-7xl md:max-h-[85vh] md:h-auto bg-white dark:bg-secondary md:rounded-2xl shadow-2xl overflow-hidden"
                >
                    <button
                        onClick={onClose}
                        className="absolute top-4 right-4 z-10 p-2 rounded-full bg-black/50 hover:bg-black/70 text-white transition-colors"
                        aria-label="Close modal"
                    >
                        <X size={24} />
                    </button>
                    {Content}
                </motion.div>
            </motion.div>
        </AnimatePresence>
    );
};

export default ProjectModal;
