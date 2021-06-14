#version 330

uniform mat4 P;
uniform mat4 V;
uniform mat4 M;

uniform vec4 lightPos = vec4(100, 0, 0, 0);
uniform vec4 lightPos2 = vec4(-100, 0, 0, 0);

in vec4 vertex; //wspolrzedne wierzcholka w przestrzeni modelu
in vec4 normal; //wektor normalny w wierzcholku
in vec2 texCoord; //wspó³rzêdne teksturowania

out vec2 i_tc;
out vec4 normalVector;
out vec4 viewerVector;
out vec4 lightVector;
out vec4 lightVector2;

void main(void) {
    vec4 vertex4 = vertex;
	vec4 normal4 = normal;

    vec4 lightPosition = lightPos;
    vec4 lightPosition2 = lightPos2;

    lightVector = normalize(V*lightPosition - V*M*vertex4);
    lightVector2 = normalize(V*lightPosition2 - V*M*vertex4);

    normalVector = normalize(V*M*normal4);
    viewerVector = normalize(vec4(0,0,0,1) - V*M*vertex4);

    gl_Position = P*V*M*vertex4;
    i_tc = texCoord;
}