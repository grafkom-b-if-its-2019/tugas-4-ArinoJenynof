precision mediump float;

varying vec3 fColor;
varying vec3 fNormal;
varying vec3 fPosition;
varying vec2 fTexCoord;

uniform vec3 diffuseColor;
uniform vec3 diffusePosition; //titik sumber chaya
uniform vec3 ambientColor;
uniform int fFlag;

uniform sampler2D sampler0;

void main() {
  if (fFlag == 0){
    //arah cahaya = lokasi titik verteks - lokasi titik sumber cahaya
    vec3 diffuseDirection = normalize(diffusePosition - fPosition);
    //nilai intensitas cahaya = nilai COS sudut antara arah datang cahaya dengan arah vektor normal = dot product dari vektor arah datang cahaya • arah vektor normal
    float normalDotLight = max(dot(fNormal, diffuseDirection), 0.0);

    //mendapatkan nilai warna (RGBA) dari tekstur
    vec4 textureColor = texture2D(sampler0, fTexCoord);
    vec3 diffuse = diffuseColor * textureColor.rgb * normalDotLight;
    vec3 ambient = ambientColor * textureColor.rgb;

    gl_FragColor = vec4(diffuse + ambient, 1.0);
  }
  else if (fFlag == 1){
    gl_FragColor = vec4(fColor, 1.0);
  }
 
}
