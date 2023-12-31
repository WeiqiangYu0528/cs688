// Termm--Fall 2023

#pragma once

#include "cs488-framework/CS488Window.hpp"
#include "cs488-framework/OpenGLImport.hpp"
#include "cs488-framework/ShaderProgram.hpp"

#include <glm/glm.hpp>

#include <vector>

// Set a global maximum number of vertices in order to pre-allocate VBO data
// in one shot, rather than reallocating each frame.
const GLsizei kMaxVertices = 1000;


// Convenience class for storing vertex data in CPU memory.
// Data should be copied over to GPU memory via VBO storage before rendering.
class VertexData {
public:
	VertexData();

	std::vector<glm::vec2> positions;
	std::vector<glm::vec3> colours;
	GLuint index;
	GLsizei numVertices;
};

class Cube {
public:
	Cube();
	void initCube();

	glm::mat4 modelM;
	std::vector<glm::vec4> vertices;
	std::vector<std::pair<glm::vec4, glm::vec4>> edges;
};

class Gnomon {
public:
	Gnomon(bool model);
	void initGnomon();

	bool model;
	glm::mat4 modelM;
	std::vector<glm::vec3> colours;
	std::vector<std::pair<glm::vec4, glm::vec4>> edges;
};

class Camera {
public:
	Camera();
	void initCamera();
	void updateCamera(glm::mat4& trans);
	void initViewMatrix(glm::mat4& viewM);

	glm::vec3 up;
	glm::vec3 cameraPos;
	glm::vec3 cameraFront;
	glm::vec3 cameraRight;
	glm::vec3 cameraUp;
};

class Frustum {
public:
	glm::vec4 viewLines[6];
	Frustum() = default;
	bool isInsideFrustum(glm::vec4& p1, glm::vec4& p2);
	bool clipLine(glm::vec4& line, glm::vec4& p1, glm::vec4& p2);
};

enum class Mode {
	RotateView,
	TranslateView,
	Perspective,
	RotateModel,
	TranslateModel,
	ScaleModel,
	Viewport
};

class A2 : public CS488Window {
public:
	A2();
	virtual ~A2();

protected:
	virtual void init() override;
	virtual void appLogic() override;
	virtual void guiLogic() override;
	virtual void draw() override;
	virtual void cleanup() override;

	virtual bool cursorEnterWindowEvent(int entered) override;
	virtual bool mouseMoveEvent(double xPos, double yPos) override;
	virtual bool mouseButtonInputEvent(int button, int actions, int mods) override;
	virtual bool mouseScrollEvent(double xOffSet, double yOffSet) override;
	virtual bool windowResizeEvent(int width, int height) override;
	virtual bool keyInputEvent(int key, int action, int mods) override;

	void createShaderProgram();
	void enableVertexAttribIndices();
	void generateVertexBuffers();
	void mapVboDataToVertexAttributeLocation();
	void uploadVertexDataToVbos();

	void initLineData();

	void setLineColour(const glm::vec3 & colour);

	void drawLine (
			const glm::vec2 & v0,
			const glm::vec2 & v1
	);

	void reset();
	void initProjectionMatrix();
	void drawViewport();
	void drawCube();
	void drawGnomon(Gnomon& gnomon);
	void homogenize(glm::vec4& position);
	void translate(bool view);
	void scale();
	void rotate(bool view);
	void perspective();
	void transform();
	glm::vec2 viewportTransform(glm::vec4& position);
	glm::vec4 getProjectedPosition(glm::vec4& position, glm::mat4& modelM);
	Frustum createFrustum();

	// bool clipNearPlane(glm::vec4& v1, glm::vec4& v2);

	ShaderProgram m_shader;

	GLuint m_vao;            // Vertex Array Object
	GLuint m_vbo_positions;  // Vertex Buffer Object
	GLuint m_vbo_colours;    // Vertex Buffer Object


	VertexData m_vertexData;

	// 2-component vector of floats.
	// Represents mouse position in GL coordinates.
	// Coordinates span [-1,1] along x and y directions within window.
	glm::vec2 m_mouse_GL_coordinate;
	glm::vec2 m_prev_mouse_GL_coordinate;
	glm::vec2 m_viewport_start_coordinate;
	glm::vec2 m_viewport_end_coordinate;
	// True if mouse button is currently down.
	bool m_mouseButtonActive;
	bool m_leftMouseButtonActive;
	bool m_rightMouseButtonActive;
	bool m_middleMouseButtonActive;
	Camera m_camera;
	Frustum m_frustum;

	Mode m_mode;
	int m_mode_index;
	float fov = 30.0f;
	float near = 1.0f;
	float far = 30.0f;

	glm::mat4 m_viewM;
	glm::mat4 m_projM;

	glm::vec3 m_currentLineColour;

	Cube m_cube;
	Gnomon m_modelGnomon;
	Gnomon m_worldGnomon;
};