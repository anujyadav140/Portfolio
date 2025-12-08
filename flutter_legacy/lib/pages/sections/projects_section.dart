import 'package:flutter/material.dart';
import 'package:anuj_yadav/design/theme/minimalist_theme.dart';
import 'package:anuj_yadav/widgets/section_header.dart';
import 'package:anuj_yadav/widgets/project_card.dart';
import 'package:anuj_yadav/widgets/fade_in_up.dart';
import 'package:anuj_yadav/models/project_model.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 1200;
    final isMediumScreen = size.width > 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isLargeScreen ? 120 : (isMediumScreen ? 60 : 24),
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          const SectionHeader(
            number: "02",
            title: "Projects",
            subtitle: "Things I've built",
          ),
          
          const SizedBox(height: 16),
          
          // Featured projects description
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              "A selection of projects that showcase my skills in product management, "
              "software development, and creating user-centered solutions.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isLargeScreen ? 18 : 16,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Projects grid
          _buildProjectsGrid(context, isLargeScreen, isMediumScreen),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context, bool isLargeScreen, bool isMediumScreen) {
    final projects = ProjectModel.getFeaturedProjects();
    
    // For large screens: 3x3 grid, medium screens: 2x4 grid, mobile: 1 column
    if (isLargeScreen) {
      return _build3x3Grid(projects);
    } else if (isMediumScreen) {
      return _build2xNGrid(projects);
    } else {
      return _buildMobileGrid(projects);
    }
  }
  
  Widget _build3x3Grid(List<ProjectModel> projects) {
    return Column(
      children: [
        // First row
        Row(
          children: [
            for (int i = 0; i < 3 && i < projects.length; i++) ...[
              Expanded(
                child: FadeInUp(
                  delay: Duration(milliseconds: 400 + i * 150),
                  child: ProjectCard(
                    project: projects[i],
                    isLarge: false,
                    index: i,
                  ),
                ),
              ),
              if (i < 2) const SizedBox(width: 24),
            ],
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Second row
        Row(
          children: [
            for (int i = 3; i < 6 && i < projects.length; i++) ...[
              Expanded(
                child: FadeInUp(
                  delay: Duration(milliseconds: 850 + (i - 3) * 150),
                  child: ProjectCard(
                    project: projects[i],
                    isLarge: false,
                    index: i,
                  ),
                ),
              ),
              if (i < 5) const SizedBox(width: 24),
            ],
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Third row
        Row(
          children: [
            for (int i = 6; i < 9 && i < projects.length; i++) ...[
              Expanded(
                child: FadeInUp(
                  delay: Duration(milliseconds: 1300 + (i - 6) * 150),
                  child: ProjectCard(
                    project: projects[i],
                    isLarge: false,
                    index: i,
                  ),
                ),
              ),
              if (i < 8 && i < projects.length - 1) const SizedBox(width: 24),
            ],
            // Fill remaining space if we have fewer than 3 projects in the last row
            if (projects.length < 9) ...[
              for (int i = projects.length; i < 9; i++) ...[
                Expanded(child: Container()),
                if (i < 8) const SizedBox(width: 24),
              ],
            ],
          ],
        ),
        
        const SizedBox(height: 32),
        
      ],
    );
  }
  
  Widget _build2xNGrid(List<ProjectModel> projects) {
    final rows = <Widget>[];
    
    for (int row = 0; row < (projects.length / 2).ceil(); row++) {
      final rowChildren = <Widget>[];
      
      for (int col = 0; col < 2; col++) {
        final index = row * 2 + col;
        if (index < projects.length) {
          rowChildren.add(
            Expanded(
              child: FadeInUp(
                delay: Duration(milliseconds: 400 + index * 200),
                child: ProjectCard(
                  project: projects[index],
                  isLarge: false,
                  index: index,
                ),
              ),
            ),
          );
          if (col == 0) rowChildren.add(const SizedBox(width: 24));
        } else {
          rowChildren.add(Expanded(child: Container()));
          if (col == 0) rowChildren.add(const SizedBox(width: 24));
        }
      }
      
      rows.add(Row(children: rowChildren));
      if (row < (projects.length / 2).ceil() - 1) {
        rows.add(const SizedBox(height: 16));
      }
    }
    
    return Column(children: rows);
  }
  
  Widget _buildMobileGrid(List<ProjectModel> projects) {
    return Column(
      children: [
        for (int i = 0; i < projects.length; i++) ...[
          FadeInUp(
            delay: Duration(milliseconds: 400 + i * 200),
            child: ProjectCard(
              project: projects[i],
              isLarge: false,
              index: i,
            ),
          ),
          if (i < projects.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }
}