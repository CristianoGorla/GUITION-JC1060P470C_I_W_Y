idf_component_register(
    SRCS "src/guition_jc1060.c"
         "src/display.c"
         "src/touch.c"
    INCLUDE_DIRS "include"
    PRIV_INCLUDE_DIRS "src"
    REQUIRES esp_lcd_mipi_dsi esp_lcd_touch_gt911 esp_codec_dev
)
