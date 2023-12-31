// Termm--Fall 2023

#include "PhongMaterial.hpp"

PhongMaterial::PhongMaterial(
	const glm::vec3& kd, const glm::vec3& ks, double shininess )
	: m_kd(kd)
	, m_ks(ks)
	, m_shininess(shininess)
{}

PhongMaterial::~PhongMaterial()
{}

glm::vec3 PhongMaterial::getDiffuse() const {
	return m_kd;
}

glm::vec3 PhongMaterial::getSpecular() const {
	return m_ks;
}

double PhongMaterial::getShininess() const {
	return m_shininess;
}