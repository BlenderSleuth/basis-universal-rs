#
# Copyright (c) 2024 Ben Sutherland.
#

bindgen vendor/transcoding_wrapper.cpp -o src/transcoding_bindings.rs \
  --allowlist-function basis_get_bytes_per_block_or_pixel \
  --allowlist-function basis_get_format_name \
  --allowlist-function basis_get_block_format_name \
  --allowlist-function basis_transcoder_format_has_alpha \
  --allowlist-function basis_get_basisu_texture_format \
  --allowlist-function basis_get_texture_type_name \
  \
  --allowlist-function basis_transcoder_format_is_uncompressed \
  --allowlist-function basis_block_format_is_uncompressed \
  --allowlist-function basis_get_uncompressed_bytes_per_pixel \
  --allowlist-function basis_get_block_width \
  --allowlist-function basis_get_block_height \
  --allowlist-function basis_is_format_supported \
  --allowlist-function basis_validate_output_buffer_size \
  \
  --allowlist-function low_level_uastc_transcoder_new \
  --allowlist-function low_level_uastc_transcoder_delete \
  \
  --allowlist-function low_level_uastc_transcoder_transcode_slice \
  \
  --allowlist-function transcoder_new \
  --allowlist-function transcoder_delete \
  \
  --allowlist-function transcoder_validate_file_checksums \
  --allowlist-function transcoder_validate_header \
  --allowlist-function transcoder_get_texture_type \
  --allowlist-function transcoder_get_userdata \
  \
  --allowlist-function transcoder_get_total_images \
  --allowlist-function transcoder_get_tex_format \
  --allowlist-function transcoder_get_total_image_levels \
  \
  --allowlist-function transcoder_get_image_level_desc \
  --allowlist-function transcoder_get_image_info \
  --allowlist-function transcoder_get_image_level_info \
  --allowlist-function transcoder_get_file_info \
  \
  --allowlist-function transcoder_start_transcoding \
  --allowlist-function transcoder_stop_transcoding \
  --allowlist-function transcoder_get_ready_to_transcode \
  --allowlist-function transcoder_transcode_image_level \
  \
  --allowlist-function basisu_transcoder_init \
  \
  --opaque-type LowLevelUastcTranscoder \
  --opaque-type basist::block_format \
  \
  --opaque-type Transcoder \
  --opaque-type basist::basisu_transcoder_state \
  \
  -- -x c++ -std=c++14
