// Termm--Fall 2023
#include <algorithm>
#include <iostream>
#include "Primitive.hpp"
#include "polyroots.hpp"
#include "Mesh.hpp"

Primitive::~Primitive()
{
}

Sphere::Sphere()
{
    m_sphere = std::make_unique<NonhierSphere>(glm::vec3(0.0, 0.0, 0.0), 1.0);
}

Sphere::~Sphere()
{
}

bool Sphere::intersect(Ray& ray, IntersectionData& data) {
    return m_sphere->intersect(ray, data);
}

Cube::Cube() {
    m_cube = std::make_unique<NonhierBox>(glm::vec3(0.0, 0.0, 0.0), 1.0);
}

Cube::~Cube()
{
}

bool Cube::intersect(Ray& ray, IntersectionData& data) {
    return m_cube->intersect(ray, data);
}

NonhierSphere::~NonhierSphere()
{
}

bool NonhierSphere::intersect(Ray& ray, IntersectionData& data) {
    glm::vec3 distance = ray.origin - m_pos;
    double t = -1.0;
    double A = glm::dot(ray.direction, ray.direction);
    double B = 2 * glm::dot(ray.direction, distance);
    double C = glm::dot(distance, distance) - m_radius * m_radius;
    double roots[2] = {0.0, 0.0};;
    size_t res = quadraticRoots(A, B, C, roots);
    // if both roots are positive, select the closest one
    if (roots[0] > 0 && roots[1] > 0) {
        t = std::min(roots[0], roots[1]);
    }
    // if one root is positive, return the maximum one
    else if (roots[0] > 0 || roots[1] > 0) {
        t = std::max(roots[0], roots[1]);
    }
    // otherwise, no intersection
    bool intersected = t > ray.t_lower_bound && t < data.t;
    if (intersected) {
        data.t = t;
        data.position = ray.getPosition(t);
        data.normal = data.position - m_pos;
    }

    return intersected;
}

NonhierBox::NonhierBox(const glm::vec3& pos, double size) :
    m_pos(pos), m_size(size)
{
    // std::vector<glm::vec3> vertices = {
    //     glm::vec3(m_pos.x, m_pos.y, m_pos.z),
    //     glm::vec3(m_pos.x + m_size, m_pos.y, m_pos.z),
    //     glm::vec3(m_pos.x, m_pos.y + m_size, m_pos.z),
    //     glm::vec3(m_pos.x + m_size, m_pos.y + m_size, m_pos.z),
    //     glm::vec3(m_pos.x, m_pos.y, m_pos.z + m_size),
    //     glm::vec3(m_pos.x + m_size, m_pos.y, m_pos.z + m_size),
    //     glm::vec3(m_pos.x, m_pos.y + m_size, m_pos.z + m_size),
    //     glm::vec3(m_pos.x + m_size, m_pos.y + m_size, m_pos.z + m_size)
    // };

    // std::vector<Triangle> faces = {
    //     Triangle(0, 1, 2),
    //     Triangle(1, 3, 2),
    //     Triangle(0, 1, 4),
    //     Triangle(1, 5, 4),
    //     Triangle(2, 3, 6),
    //     Triangle(3, 7, 6),
    //     Triangle(0, 6, 2),
    //     Triangle(0, 4, 6),
    //     Triangle(1, 5, 3),
    //     Triangle(3, 5, 7),
    //     Triangle(4, 7, 6),
    //     Triangle(4, 5, 7)
    // };
    glm::vec3 max_pos = m_pos + glm::vec3(m_size, m_size, m_size);
    m_box = std::make_unique<NonhierBoxExtension>(m_pos, max_pos);
}

NonhierBox::~NonhierBox()
{
}

bool NonhierBox::intersect(Ray& ray, IntersectionData& data) {
    return m_box->intersect(ray, data);
}

NonhierBoxExtension::NonhierBoxExtension(const glm::vec3& min_pos, const glm::vec3& max_pos) :
    min_pos(min_pos), max_pos(max_pos)
{

}
bool NonhierBoxExtension::intersect(Ray& ray, IntersectionData& data) {
    glm::vec3 invdir(1.0f / ray.direction.x, 1.0f / ray.direction.y, 1.0f / ray.direction.z);
    glm::vec3 normal;

    double t_min, t_max, t_xmin, t_xmax, t_ymin, t_ymax, t_zmin, t_zmax;

    if (invdir.x >= 0) {
        t_xmin = (min_pos.x - ray.origin.x) * invdir.x;
        t_xmax = (max_pos.x - ray.origin.x) * invdir.x;
    } else {
        t_xmin = (max_pos.x - ray.origin.x) * invdir.x;
        t_xmax = (min_pos.x - ray.origin.x) * invdir.x;
    }

    if (invdir.y >= 0) {
        t_ymin = (min_pos.y - ray.origin.y) * invdir.y;
        t_ymax = (max_pos.y - ray.origin.y) * invdir.y;
    } else {
        t_ymin = (max_pos.y - ray.origin.y) * invdir.y;
        t_ymax = (min_pos.y - ray.origin.y) * invdir.y;
    }


    if ((t_xmin > t_ymax) || (t_ymin > t_xmax)) {
        return false;
    }

    t_min = std::max(t_xmin, t_ymin);
    t_max = std::min(t_xmax, t_ymax);

    if (invdir.z >= 0) {
        t_zmin = (min_pos.z - ray.origin.z) * invdir.z;
        t_zmax = (max_pos.z - ray.origin.z) * invdir.z;
    } else {
        t_zmin = (max_pos.z - ray.origin.z) * invdir.z;
        t_zmax = (min_pos.z - ray.origin.z) * invdir.z;
    }

    if ((t_min > t_zmax) || (t_zmin > t_max)){
        return false;
    }

    t_min = std::max(t_min, t_zmin);
    t_max = std::min(t_max, t_zmax);

    if (t_min < 0) {
        t_min = t_max;
        if (t_min < 0) {
            return false;
        }
    }

    if (t_min == t_xmin) {
        normal = glm::vec3(-1.0f, 0.0f, 0.0f) * invdir.x;
    } else if (t_min == t_ymin) {
        normal = glm::vec3(0.0f, -1.0f, 0.0f) * invdir.y;
    } else if (t_min == t_zmin) {
        normal =  glm::vec3(0.0f, 0.0f, -1.0f) * invdir.z;
    } else if (t_min == t_xmax) {
        normal = glm::vec3(1.0f, 0.0f, 0.0f) * invdir.x;
    } else if (t_min == t_ymax) {
        normal = glm::vec3(0.0f, 1.0f, 0.0f) * invdir.y;
    } else if (t_min == t_zmax) {
        normal = glm::vec3(0.0f, 0.0f, 1.0f) * invdir.z;
    }

    bool intersected = t_min > ray.t_lower_bound && t_min < data.t;
    if (intersected) {
        data.t = t_min;
        data.position = ray.getPosition(t_min);
        data.normal = glm::normalize(normal);
        // std::cout << data.normal.x << " " << data.normal.y << " " << data.normal.z << std::endl;
    }

    return intersected;

}

NonhierBoxExtension::~NonhierBoxExtension() {
}

