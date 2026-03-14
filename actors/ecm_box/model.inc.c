Lights1 ecm_box__52846167_f3d_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Lights1 ecm_box__5853458_f3d_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Lights1 ecm_box__52681125_f3d_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Gfx ecm_box__52846167_ci4_aligner[] = {gsSPEndDisplayList()};
u8 ecm_box__52846167_ci4[] = {
	#include "actors/ecm_box/_52846167.ci4.inc.c"
};

Gfx ecm_box__52846167_pal_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 ecm_box__52846167_pal_rgba16[] = {
	#include "actors/ecm_box/_52846167.rgba16.pal"
};

Gfx ecm_box__5853458_ci4_aligner[] = {gsSPEndDisplayList()};
u8 ecm_box__5853458_ci4[] = {
	#include "actors/ecm_box/_5853458.ci4.inc.c"
};

Gfx ecm_box__5853458_pal_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 ecm_box__5853458_pal_rgba16[] = {
	#include "actors/ecm_box/_5853458.rgba16.pal"
};

Gfx ecm_box__52681125_ci4_aligner[] = {gsSPEndDisplayList()};
u8 ecm_box__52681125_ci4[] = {
	#include "actors/ecm_box/_52681125.ci4.inc.c"
};

Gfx ecm_box__52681125_pal_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 ecm_box__52681125_pal_rgba16[] = {
	#include "actors/ecm_box/_52681125.rgba16.pal"
};

Vtx ecm_box_6d80_mesh_layer_1_vtx_cull[8] = {
	{{{-71, 0, 71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{-71, 143, 71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{-71, 143, -71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{-71, 0, -71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{71, 0, 71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{71, 143, 71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{71, 143, -71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{71, 0, -71}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
};

Vtx ecm_box_6d80_mesh_layer_1_vtx_0[14] = {
	{{{-71, 71, -71}, 0, {2016, 3040}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{0, 89, -71}, 0, {992, 3296}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{-71, 0, -71}, 0, {2016, 2016}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{-71, 0, 71}, 0, {-32, 2016}, {0x00, 0x00, 0x7F, 0xFF}}},
	{{{71, 0, 71}, 0, {2016, 2016}, {0x00, 0x00, 0x7F, 0xFF}}},
	{{{-71, 143, 71}, 0, {-32, 4064}, {0x00, 0x00, 0x7F, 0xFF}}},
	{{{71, 143, 71}, 0, {2016, 4064}, {0x00, 0x00, 0x7F, 0xFF}}},
	{{{71, 0, -71}, 0, {-32, 2016}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{71, 143, -71}, 0, {-32, 4064}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{-71, 143, -71}, 0, {2016, 4064}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{0, 143, -71}, 0, {992, 4064}, {0x00, 0x00, 0x81, 0xFF}}},
	{{{0, 89, 71}, 0, {992, 3296}, {0x00, 0x00, 0x7F, 0xFF}}},
	{{{0, 143, 71}, 0, {992, 4064}, {0x00, 0x00, 0x7F, 0xFF}}},
	{{{71, 71, -71}, 0, {-32, 3040}, {0x00, 0x00, 0x81, 0xFF}}},
};

Gfx ecm_box_6d80_mesh_layer_1_tri_0[] = {
	gsSPVertex(ecm_box_6d80_mesh_layer_1_vtx_0 + 0, 14, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(4, 6, 5, 0, 7, 2, 8, 0),
	gsSP2Triangles(2, 9, 8, 0, 1, 0, 9, 0),
	gsSP2Triangles(1, 9, 10, 0, 11, 12, 5, 0),
	gsSP2Triangles(3, 11, 5, 0, 3, 4, 11, 0),
	gsSP2Triangles(4, 6, 11, 0, 6, 12, 11, 0),
	gsSP2Triangles(1, 10, 8, 0, 13, 1, 8, 0),
	gsSP2Triangles(1, 7, 2, 0, 7, 1, 13, 0),
	gsSPEndDisplayList(),
};

Vtx ecm_box_6d80_mesh_layer_1_vtx_1[21] = {
	{{{-71, 0, 71}, 0, {2016, 2016}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{-71, 143, 71}, 0, {2016, 4064}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{-71, 89, 0}, 0, {992, 3296}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{-71, 143, 0}, 0, {992, 4064}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{-71, 143, 71}, 0, {2016, 4064}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{-71, 89, 0}, 0, {992, 3296}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{71, 0, 71}, 0, {-32, 2016}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{71, 89, 0}, 0, {992, 3296}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{71, 143, 71}, 0, {-32, 4064}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{71, 143, 71}, 0, {-32, 4064}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{71, 143, 0}, 0, {992, 4064}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{71, 89, 0}, 0, {992, 3296}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{71, 0, -71}, 0, {2016, 2016}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{71, 71, -71}, 0, {2016, 3040}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{71, 0, -71}, 0, {2016, 2016}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{71, 143, -71}, 0, {2016, 4064}, {0x7F, 0x00, 0x00, 0xFF}}},
	{{{-71, 0, -71}, 0, {-32, 2016}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{-71, 143, -71}, 0, {-32, 4064}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{-71, 143, 0}, 0, {992, 4064}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{-71, 71, -71}, 0, {-32, 3040}, {0x81, 0x00, 0x00, 0xFF}}},
	{{{71, 143, -71}, 0, {2016, 4064}, {0x81, 0x00, 0x00, 0xFF}}},
};

Gfx ecm_box_6d80_mesh_layer_1_tri_1[] = {
	gsSPVertex(ecm_box_6d80_mesh_layer_1_vtx_1 + 0, 21, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 9, 10, 11, 0),
	gsSP2Triangles(12, 7, 6, 0, 13, 14, 11, 0),
	gsSP2Triangles(6, 15, 8, 0, 6, 12, 15, 0),
	gsSP2Triangles(16, 1, 17, 0, 16, 0, 1, 0),
	gsSP2Triangles(2, 18, 17, 0, 19, 2, 17, 0),
	gsSP2Triangles(2, 16, 0, 0, 16, 2, 19, 0),
	gsSP2Triangles(10, 20, 11, 0, 20, 13, 11, 0),
	gsSPEndDisplayList(),
};

Vtx ecm_box_6d80_mesh_layer_1_vtx_2[20] = {
	{{{-71, 143, 0}, 0, {992, 2016}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{0, 143, -71}, 0, {2016, 3040}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{-71, 143, -71}, 0, {2016, 2016}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{-71, 143, 71}, 0, {-32, 2016}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{0, 143, 71}, 0, {-32, 3040}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{71, 143, -71}, 0, {2016, 2016}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{-71, 143, 71}, 0, {-32, 4064}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{71, 143, 71}, 0, {-32, 2016}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{-71, 143, -71}, 0, {2016, 4064}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{71, 0, -71}, 0, {2016, 2016}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{71, 0, 71}, 0, {-32, 2016}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{-71, 0, -71}, 0, {2016, 4064}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{-71, 0, 71}, 0, {-32, 4064}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{71, 143, 71}, 0, {-32, 4064}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{71, 143, 0}, 0, {992, 4064}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{71, 143, -71}, 0, {2016, 4064}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{71, 0, 71}, 0, {-32, 4064}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{-71, 0, 71}, 0, {-32, 2016}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{-71, 0, -71}, 0, {2016, 2016}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{71, 0, -71}, 0, {2016, 4064}, {0x00, 0x81, 0x00, 0xFF}}},
};

Gfx ecm_box_6d80_mesh_layer_1_tri_2[] = {
	gsSPVertex(ecm_box_6d80_mesh_layer_1_vtx_2 + 0, 20, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 0, 0),
	gsSP2Triangles(5, 6, 7, 0, 5, 8, 6, 0),
	gsSP2Triangles(9, 10, 11, 0, 10, 12, 11, 0),
	gsSP2Triangles(4, 13, 14, 0, 0, 4, 14, 0),
	gsSP2Triangles(14, 1, 0, 0, 15, 1, 14, 0),
	gsSP2Triangles(16, 17, 18, 0, 16, 18, 19, 0),
	gsSPEndDisplayList(),
};


Gfx mat_ecm_box__52846167_f3d[] = {
	gsSPSetLights1(ecm_box__52846167_f3d_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsDPSetAlphaDither(G_AD_NOISE),
	gsDPSetTextureLUT(G_TT_RGBA16),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ecm_box__52846167_pal_rgba16),
	gsDPSetTile(0, 0, 0, 256, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadTLUTCmd(5, 15),
	gsDPSetTextureImage(G_IM_FMT_CI, G_IM_SIZ_16b, 1, ecm_box__52846167_ci4),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_16b, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 512),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_4b, 4, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_ecm_box__52846167_f3d[] = {
	gsDPPipeSync(),
	gsDPSetAlphaDither(G_AD_DISABLE),
	gsDPSetTextureLUT(G_TT_NONE),
	gsSPEndDisplayList(),
};

Gfx mat_ecm_box__5853458_f3d[] = {
	gsSPSetLights1(ecm_box__5853458_f3d_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsDPSetAlphaDither(G_AD_NOISE),
	gsDPSetTextureLUT(G_TT_RGBA16),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ecm_box__5853458_pal_rgba16),
	gsDPSetTile(0, 0, 0, 256, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadTLUTCmd(5, 15),
	gsDPSetTextureImage(G_IM_FMT_CI, G_IM_SIZ_16b, 1, ecm_box__5853458_ci4),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_16b, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 512),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_4b, 4, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_ecm_box__5853458_f3d[] = {
	gsDPPipeSync(),
	gsDPSetAlphaDither(G_AD_DISABLE),
	gsDPSetTextureLUT(G_TT_NONE),
	gsSPEndDisplayList(),
};

Gfx mat_ecm_box__52681125_f3d[] = {
	gsSPSetLights1(ecm_box__52681125_f3d_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsDPSetAlphaDither(G_AD_NOISE),
	gsDPSetTextureLUT(G_TT_RGBA16),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, ecm_box__52681125_pal_rgba16),
	gsDPSetTile(0, 0, 0, 256, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadTLUTCmd(5, 15),
	gsDPSetTextureImage(G_IM_FMT_CI, G_IM_SIZ_16b, 1, ecm_box__52681125_ci4),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_16b, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 1023, 512),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_4b, 4, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0, G_TX_WRAP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_ecm_box__52681125_f3d[] = {
	gsDPPipeSync(),
	gsDPSetAlphaDither(G_AD_DISABLE),
	gsDPSetTextureLUT(G_TT_NONE),
	gsSPEndDisplayList(),
};

Gfx ecm_box_6d80_mesh_layer_1[] = {
	gsSPClearGeometryMode(G_LIGHTING),
	gsSPVertex(ecm_box_6d80_mesh_layer_1_vtx_cull + 0, 8, 0),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPCullDisplayList(0, 7),
	gsSPDisplayList(mat_ecm_box__52846167_f3d),
	gsSPDisplayList(ecm_box_6d80_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_revert_ecm_box__52846167_f3d),
	gsSPDisplayList(mat_ecm_box__5853458_f3d),
	gsSPDisplayList(ecm_box_6d80_mesh_layer_1_tri_1),
	gsSPDisplayList(mat_revert_ecm_box__5853458_f3d),
	gsSPDisplayList(mat_ecm_box__52681125_f3d),
	gsSPDisplayList(ecm_box_6d80_mesh_layer_1_tri_2),
	gsSPDisplayList(mat_revert_ecm_box__52681125_f3d),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

