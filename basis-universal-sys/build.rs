// Copyright (c) 2024 Ben Sutherland.

// args from the basis cmake file
fn build_with_common_settings() -> cc::Build {
    let mut build = cc::Build::new();
    build
        .flag_if_supported("-fvisibility=hidden")
        .flag_if_supported("-fno-strict-aliasing")
        .flag_if_supported("-Wall")
        .flag_if_supported("-Wextra")
        .flag_if_supported("-Wno-unused-local-typedefs")
        .flag_if_supported("-Wno-unused-value")
        .flag_if_supported("-Wno-unused-parameter")
        .flag_if_supported("-Wno-unused-variable");

    build
}

/*
*/

fn main() {
    build_with_common_settings()
        .cpp(true)
        .flag_if_supported("--std=c++14")
        .define("BASISD_SUPPORT_KTX2", "0")
        .define("BASISD_SUPPORT_KTX2_ZSTD", "0")
        .define("BASISU_SUPPORT_SSE", "1")
        // Enable required formats:
        .define("BASISD_SUPPORT_UASTC", "1")
        .define("BASISD_SUPPORT_UASTC_HDR", "1")
        .define("BASISD_SUPPORT_DXT5A", "1")
        .define("BASISD_SUPPORT_BC7", "1")
        .define("BASISD_SUPPORT_BC7_MODE5", "1")
        // Disable the rest.
        .define("BASISD_SUPPORT_DXT1", "0")
        .define("BASISD_SUPPORT_PVRTC1", "0")
        .define("BASISD_SUPPORT_ETC2_EAC_A8", "0")
        .define("BASISD_SUPPORT_ASTC", "0")
        .define("BASISD_SUPPORT_ATC", "0")
        .define("BASISD_SUPPORT_ASTC_HIGHER_OPAQUE_QUALITY", "0")
        .define("BASISD_SUPPORT_ETC2_EAC_RG11", "0")
        .define("BASISD_SUPPORT_FXT1", "0")
        .define("BASISD_SUPPORT_PVRTC2", "0")
        // Transcoder source.
        .file("vendor/basis_universal/transcoder/basisu_transcoder.cpp")
        //.file("vendor/basis_universal/zstd/zstddeclib.c")
        .file("vendor/transcoding_wrapper.cpp")
        .compile("basisuniversal");

    // We regenerate binding code and check it in. (See generate_bindings.sh)
}
