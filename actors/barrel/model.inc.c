Lights1 barrel_Material__50_f3d_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Lights1 barrel_Material__49_f3d_lights = gdSPDefLights1(
	0x7F, 0x7F, 0x7F,
	0xFF, 0xFF, 0xFF, 0x28, 0x28, 0x28);

Gfx barrel__5736BA6B_c_ci4_aligner[] = {gsSPEndDisplayList()};
u8 barrel__5736BA6B_c_ci4[] = {
	#include "aa/barrel/_5736BA6B_c.ci4.inc.c"
};

Gfx barrel__5736BA6B_c_pal_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 barrel__5736BA6B_c_pal_rgba16[] = {
	#include "aa/barrel/_5736BA6B_c.rgba16.pal"
};

Gfx barrel__1CF5C9C9_c_ci4_aligner[] = {gsSPEndDisplayList()};
u8 barrel__1CF5C9C9_c_ci4[] = {
	#include "aa/barrel/_1CF5C9C9_c.ci4.inc.c"
};

Gfx barrel__1CF5C9C9_c_pal_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 barrel__1CF5C9C9_c_pal_rgba16[] = {
	#include "aa/barrel/_1CF5C9C9_c.rgba16.pal"
};

Vtx barrel_barrel_mesh_layer_1_vtx_cull[8] = {
	{{{-46, 4, 43}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{-46, 105, 43}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{-46, 105, -46}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{-46, 4, -46}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{48, 4, 43}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{48, 105, 43}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{48, 105, -46}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
	{{{48, 4, -46}, 0, {0, 0}, {0x00, 0x00, 0x00, 0x00}}},
};

Vtx barrel_barrel_mesh_layer_1_vtx_0[54] = {
	{{{30, 55, -46}, 0, {307, 496}, {0x00, 0xEC, 0x83, 0xFF}}},
	{{{-22, 4, -38}, 0, {678, 1008}, {0x00, 0xEC, 0x83, 0xFF}}},
	{{{-28, 55, -46}, 0, {686, 496}, {0x00, 0xEC, 0x83, 0xFF}}},
	{{{-36, 4, 5}, 0, {1068, 1008}, {0x89, 0xEB, 0xD9, 0xFF}}},
	{{{-28, 55, -46}, 0, {686, 496}, {0x89, 0xEB, 0xD9, 0xFF}}},
	{{{-22, 4, -38}, 0, {678, 1008}, {0x89, 0xEB, 0xD9, 0xFF}}},
	{{{30, 55, -46}, 0, {307, 496}, {0x00, 0xED, 0x82, 0xFF}}},
	{{{24, 4, -38}, 0, {314, 1008}, {0x00, 0xED, 0x82, 0xFF}}},
	{{{-22, 4, -38}, 0, {678, 1008}, {0x00, 0xED, 0x82, 0xFF}}},
	{{{-36, 4, 5}, 0, {1068, 1008}, {0x89, 0xEB, 0xD9, 0xFF}}},
	{{{-46, 55, 9}, 0, {1078, 496}, {0x89, 0xEB, 0xD9, 0xFF}}},
	{{{-28, 55, -46}, 0, {686, 496}, {0x89, 0xEB, 0xD9, 0xFF}}},
	{{{-46, 55, 9}, 0, {1078, 496}, {0x89, 0x15, 0xD9, 0xFF}}},
	{{{-22, 105, -38}, 0, {678, -16}, {0x89, 0x15, 0xD9, 0xFF}}},
	{{{-28, 55, -46}, 0, {686, 496}, {0x89, 0x15, 0xD9, 0xFF}}},
	{{{-46, 55, 9}, 0, {1078, 496}, {0x89, 0x15, 0xD9, 0xFF}}},
	{{{-36, 105, 5}, 0, {1068, -16}, {0x89, 0x15, 0xD9, 0xFF}}},
	{{{-22, 105, -38}, 0, {678, -16}, {0x89, 0x15, 0xD9, 0xFF}}},
	{{{1, 55, 43}, 0, {1521, 496}, {0xB7, 0x15, 0x66, 0xFF}}},
	{{{-36, 105, 5}, 0, {1068, -16}, {0xB7, 0x15, 0x66, 0xFF}}},
	{{{-46, 55, 9}, 0, {1078, 496}, {0xB7, 0x15, 0x66, 0xFF}}},
	{{{38, 4, 5}, 0, {1971, 1008}, {0x49, 0xEB, 0x65, 0xFF}}},
	{{{1, 55, 43}, 0, {1521, 496}, {0x49, 0xEB, 0x65, 0xFF}}},
	{{{1, 4, 32}, 0, {1519, 1008}, {0x49, 0xEB, 0x65, 0xFF}}},
	{{{1, 55, 43}, 0, {1521, 496}, {0xB7, 0x15, 0x65, 0xFF}}},
	{{{1, 105, 32}, 0, {1519, -16}, {0xB7, 0x15, 0x65, 0xFF}}},
	{{{-36, 105, 5}, 0, {1068, -16}, {0xB7, 0x15, 0x65, 0xFF}}},
	{{{38, 4, 5}, 0, {1971, 1008}, {0x49, 0xEA, 0x66, 0xFF}}},
	{{{48, 55, 9}, 0, {1959, 496}, {0x49, 0xEA, 0x66, 0xFF}}},
	{{{1, 55, 43}, 0, {1521, 496}, {0x49, 0xEA, 0x66, 0xFF}}},
	{{{24, 4, -38}, 0, {314, 1008}, {0x77, 0xEB, 0xD9, 0xFF}}},
	{{{30, 55, -46}, 0, {307, 496}, {0x77, 0xEB, 0xD9, 0xFF}}},
	{{{48, 55, 9}, 0, {-88, 496}, {0x77, 0xEB, 0xD9, 0xFF}}},
	{{{24, 4, -38}, 0, {314, 1008}, {0x77, 0xEB, 0xD9, 0xFF}}},
	{{{48, 55, 9}, 0, {-88, 496}, {0x77, 0xEB, 0xD9, 0xFF}}},
	{{{38, 4, 5}, 0, {-76, 1008}, {0x77, 0xEB, 0xD9, 0xFF}}},
	{{{30, 55, -46}, 0, {307, 496}, {0x77, 0x15, 0xD9, 0xFF}}},
	{{{38, 105, 5}, 0, {-76, -16}, {0x77, 0x15, 0xD9, 0xFF}}},
	{{{48, 55, 9}, 0, {-88, 496}, {0x77, 0x15, 0xD9, 0xFF}}},
	{{{30, 55, -46}, 0, {307, 496}, {0x77, 0x15, 0xD9, 0xFF}}},
	{{{24, 105, -38}, 0, {314, -16}, {0x77, 0x15, 0xD9, 0xFF}}},
	{{{38, 105, 5}, 0, {-76, -16}, {0x77, 0x15, 0xD9, 0xFF}}},
	{{{-36, 4, 5}, 0, {1068, 1008}, {0xB7, 0xEB, 0x65, 0xFF}}},
	{{{1, 55, 43}, 0, {1521, 496}, {0xB7, 0xEB, 0x65, 0xFF}}},
	{{{-46, 55, 9}, 0, {1078, 496}, {0xB7, 0xEB, 0x66, 0xFF}}},
	{{{1, 4, 32}, 0, {1519, 1008}, {0xB7, 0xEB, 0x65, 0xFF}}},
	{{{1, 55, 43}, 0, {1521, 496}, {0x49, 0x15, 0x65, 0xFF}}},
	{{{38, 105, 5}, 0, {1971, -16}, {0x49, 0x15, 0x65, 0xFF}}},
	{{{1, 105, 32}, 0, {1519, -16}, {0x49, 0x15, 0x65, 0xFF}}},
	{{{48, 55, 9}, 0, {1959, 496}, {0x49, 0x16, 0x66, 0xFF}}},
	{{{-22, 105, -38}, 0, {678, -16}, {0x00, 0x13, 0x82, 0xFF}}},
	{{{30, 55, -46}, 0, {307, 496}, {0x00, 0x13, 0x82, 0xFF}}},
	{{{-28, 55, -46}, 0, {686, 496}, {0x00, 0x14, 0x83, 0xFF}}},
	{{{24, 105, -38}, 0, {314, -16}, {0x00, 0x13, 0x82, 0xFF}}},
};

Gfx barrel_barrel_mesh_layer_1_tri_0[] = {
	gsSPVertex(barrel_barrel_mesh_layer_1_vtx_0 + 0, 30, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 9, 10, 11, 0),
	gsSP2Triangles(12, 13, 14, 0, 15, 16, 17, 0),
	gsSP2Triangles(18, 19, 20, 0, 21, 22, 23, 0),
	gsSP2Triangles(24, 25, 26, 0, 27, 28, 29, 0),
	gsSPVertex(barrel_barrel_mesh_layer_1_vtx_0 + 30, 24, 0),
	gsSP2Triangles(0, 1, 2, 0, 3, 4, 5, 0),
	gsSP2Triangles(6, 7, 8, 0, 9, 10, 11, 0),
	gsSP2Triangles(12, 13, 14, 0, 12, 15, 13, 0),
	gsSP2Triangles(16, 17, 18, 0, 16, 19, 17, 0),
	gsSP2Triangles(20, 21, 22, 0, 20, 23, 21, 0),
	gsSPEndDisplayList(),
};

Vtx barrel_barrel_mesh_layer_1_vtx_1[10] = {
	{{{24, 4, -38}, 0, {744, 919}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{-36, 4, 5}, 0, {92, 416}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{-22, 4, -38}, 0, {246, 919}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{1, 4, 32}, 0, {495, 106}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{38, 4, 5}, 0, {898, 416}, {0x00, 0x81, 0x00, 0xFF}}},
	{{{-36, 105, 5}, 0, {92, 416}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{24, 105, -38}, 0, {744, 919}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{-22, 105, -38}, 0, {246, 919}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{1, 105, 32}, 0, {495, 106}, {0x00, 0x7F, 0x00, 0xFF}}},
	{{{38, 105, 5}, 0, {898, 416}, {0x00, 0x7F, 0x00, 0xFF}}},
};

Gfx barrel_barrel_mesh_layer_1_tri_1[] = {
	gsSPVertex(barrel_barrel_mesh_layer_1_vtx_1 + 0, 10, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 3, 1, 0),
	gsSP2Triangles(3, 0, 4, 0, 5, 6, 7, 0),
	gsSP2Triangles(8, 6, 5, 0, 6, 8, 9, 0),
	gsSPEndDisplayList(),
};


Gfx mat_barrel_Material__50_f3d[] = {
	gsSPSetLights1(barrel_Material__50_f3d_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsDPSetAlphaDither(G_AD_NOISE),
	gsDPSetTextureLUT(G_TT_RGBA16),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, barrel__5736BA6B_c_pal_rgba16),
	gsDPSetTile(0, 0, 0, 256, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadTLUTCmd(5, 13),
	gsDPSetTextureImage(G_IM_FMT_CI, G_IM_SIZ_16b, 1, barrel__5736BA6B_c_ci4),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_16b, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 255, 1024),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_4b, 2, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_barrel_Material__50_f3d[] = {
	gsDPPipeSync(),
	gsDPSetAlphaDither(G_AD_DISABLE),
	gsDPSetTextureLUT(G_TT_NONE),
	gsSPEndDisplayList(),
};

Gfx mat_barrel_Material__49_f3d[] = {
	gsSPSetLights1(barrel_Material__49_f3d_lights),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT, TEXEL0, 0, SHADE, 0, 0, 0, 0, ENVIRONMENT),
	gsDPSetAlphaDither(G_AD_NOISE),
	gsDPSetTextureLUT(G_TT_RGBA16),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b, 1, barrel__1CF5C9C9_c_pal_rgba16),
	gsDPSetTile(0, 0, 0, 256, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadTLUTCmd(5, 14),
	gsDPSetTextureImage(G_IM_FMT_CI, G_IM_SIZ_16b, 1, barrel__1CF5C9C9_c_ci4),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_16b, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 255, 1024),
	gsDPSetTile(G_IM_FMT_CI, G_IM_SIZ_4b, 2, 0, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0, G_TX_WRAP | G_TX_NOMIRROR, 5, 0),
	gsDPSetTileSize(0, 0, 0, 124, 124),
	gsSPEndDisplayList(),
};

Gfx mat_revert_barrel_Material__49_f3d[] = {
	gsDPPipeSync(),
	gsDPSetAlphaDither(G_AD_DISABLE),
	gsDPSetTextureLUT(G_TT_NONE),
	gsSPEndDisplayList(),
};

Gfx barrel_barrel_mesh_layer_1[] = {
	gsSPClearGeometryMode(G_LIGHTING),
	gsSPVertex(barrel_barrel_mesh_layer_1_vtx_cull + 0, 8, 0),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPCullDisplayList(0, 7),
	gsSPDisplayList(mat_barrel_Material__50_f3d),
	gsSPDisplayList(barrel_barrel_mesh_layer_1_tri_0),
	gsSPDisplayList(mat_revert_barrel_Material__50_f3d),
	gsSPDisplayList(mat_barrel_Material__49_f3d),
	gsSPDisplayList(barrel_barrel_mesh_layer_1_tri_1),
	gsSPDisplayList(mat_revert_barrel_Material__49_f3d),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

