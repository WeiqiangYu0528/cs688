// Termm--Fall 2023

#pragma once

#include <glm/glm.hpp>

// Represents a simple point light.
struct Ray {
  Ray(glm::);
  
  glm::vec3 colour;
  glm::vec3 position;
  double falloff[3];
};

