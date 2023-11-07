// Termm--Fall 2023

#pragma once

#include <glm/glm.hpp>

// Represents a simple point light.
struct inter {
public:
    Ray(const glm::vec3& origin, const glm::vec3& direction);
    glm::vec3 getPosition(double t) const;
    glm::vec3 origin;
    glm::vec3 direction;
};

