Shader "Custom/EmissiveDecal" 
{
  Properties 
  {
    _MainTex ("Base (RGB)", 2D) = "white" {}
    _Emissive("Emissive", 2D) = "black" {}
    _EmissiveColor("EmissiveColor", Color) = (1,1,1,1)
    _EmissiveIntensity("EmissiveIntensity", Range(0,10) ) = 0.5
    [Toggle(EMIT_LIGHT)]
    _ToggleEmission("Emission", Float) = 0
  }

  SubShader 
  {
    Tags 
	{ 
		"RenderType"="Opaque" 
		"Queue"="Geometry+1" 
		"ForceNoShadowCasting"="True"
	}
    LOD 200
    Offset -1, -1
    
    CGPROGRAM
    #pragma surface surf Lambert decal:blend
    #pragma multi_compile __ EMIT_LIGHT
    
    sampler2D _MainTex;
    sampler2D _Emissive;
    float4 _EmissiveColor;
    float _EmissiveIntensity;

    struct Input 
    {
        float2 uv_MainTex;
        float2 uv_Emissive;
    };

    void surf (Input IN, inout SurfaceOutput o) 
	{
        half4 c = tex2D (_MainTex, IN.uv_MainTex);
        o.Albedo = c.rgb;
        o.Alpha = c.a;

        #if EMIT_LIGHT
        
        float4 Tex2D1=tex2D(_Emissive,(IN.uv_Emissive.xyxy).xy);
        float4 Multiply0=Tex2D1 * _EmissiveColor;
        float4 Multiply2=Multiply0 * _EmissiveIntensity.xxxx;
    
        o.Emission = Multiply2;

        #else

        o.Emission = 0;
        
        #endif
    }
    ENDCG
    }
}