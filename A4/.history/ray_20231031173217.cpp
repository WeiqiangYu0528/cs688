#include "ray.hpp"

Ray::Ray(glm::vec3& origin, glm::vec3& direction) : origin(origin), direction(direction) {
    // empty
}

glm::vec3Ray::getPosition(double t) {
    return origin + t * direction;
}

