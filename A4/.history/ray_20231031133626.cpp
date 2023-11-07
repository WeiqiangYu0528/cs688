#include "ray.hpp"

Ray::Ray(glm::vec3& origin, glm::vec3& direction) : origin(origin), direction(direction) {
    // empty
}

Ray::getPosi(double t) {
    return origin + direction * t;
}

