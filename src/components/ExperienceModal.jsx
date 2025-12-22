import React, { useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, ArrowLeft } from 'lucide-react';

const ExperienceModal = ({ experience, onBack }) => {
    if (!experience) return null;

    return (
        <div className="h-full overflow-y-auto bg-background custom-scrollbar">
            {/* Header */}
            <div className="p-6 border-b border-border relative">
                <button
                    onClick={onBack}
                    className="flex items-center gap-2 text-muted-foreground hover:text-foreground transition-colors mb-4 group"
                >
                    <div className="p-1 rounded-full group-hover:bg-secondary transition-colors">
                        <ArrowLeft size={20} />
                    </div>
                    <span className="font-medium">Back to Skills</span>
                </button>

                <h2 className="text-2xl font-bold text-foreground mb-2 pr-8">Experience Details</h2>
                <div className="text-muted-foreground text-sm leading-relaxed mb-6">
                    {experience.description}
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 bg-secondary/50 rounded-xl p-4 border border-border/50">
                    <div className="flex items-start gap-3">
                        <div>
                            <p className="text-xs text-muted-foreground uppercase tracking-wider font-medium">Period</p>
                            <p className="text-foreground font-medium">{experience.period}</p>
                        </div>
                    </div>
                    <div className="flex items-start gap-3">
                        <div>
                            <p className="text-xs text-muted-foreground uppercase tracking-wider font-medium">Location</p>
                            <p className="text-foreground font-medium">{experience.location || 'Remote'}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div className="p-6 space-y-8">
                {/* Skills Developed */}
                {experience.skillsDeveloped && (
                    <div>
                        <div className="mb-4">
                            <h3 className="text-lg font-bold text-foreground">Skills Developed</h3>
                        </div>
                        <div className="flex flex-wrap gap-2">
                            {experience.skillsDeveloped.map((skill, index) => (
                                <span
                                    key={index}
                                    className="px-3 py-1.5 rounded-full bg-secondary text-foreground text-sm font-medium border border-border"
                                >
                                    {skill}
                                </span>
                            ))}
                        </div>
                    </div>
                )}

                {/* Key Responsibilities */}
                {experience.responsibilities && (
                    <div>
                        <h3 className="text-lg font-bold text-foreground mb-4">Key Responsibilities</h3>
                        <div className="space-y-3">
                            {experience.responsibilities.map((item, index) => (
                                <div key={index} className="flex gap-3">
                                    <span className="text-muted-foreground mt-1.5 h-1.5 w-1.5 rounded-full bg-muted-foreground shrink-0 border border-muted-foreground" />
                                    <p className="text-muted-foreground leading-relaxed">{item}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                )}

                {/* Key Achievements */}
                {experience.achievements && (
                    <div>
                        <div className="mb-4">
                            <h3 className="text-lg font-bold text-foreground">Key Achievements</h3>
                        </div>
                        <div className="space-y-3">
                            {experience.achievements.map((item, index) => (
                                <div key={index} className="flex gap-3">
                                    <span className="text-muted-foreground mt-1.5 h-1.5 w-1.5 rounded-full bg-muted-foreground shrink-0 border border-muted-foreground" />
                                    <p className="text-muted-foreground leading-relaxed">{item}</p>
                                </div>
                            ))}
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
};

export default ExperienceModal;
