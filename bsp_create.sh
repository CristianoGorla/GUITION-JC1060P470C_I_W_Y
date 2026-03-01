#!/bin/bash

# Nome del componente BSP
BSP_NAME="guition_jc1060"
BASE_DIR="components/$BSP_NAME"

echo "Creazione struttura BSP per Guition ESP32-P4..."

# 1. Creazione delle directory
mkdir -p $BASE_DIR/include/bsp
mkdir -p $BASE_DIR/src

# 2. Creazione CMakeLists.txt per il componente
cat <<EOF > $BASE_DIR/CMakeLists.txt
idf_component_register(
    SRCS "src/guition_jc1060.c"
         "src/display.c"
         "src/touch.c"
    INCLUDE_DIRS "include"
    PRIV_INCLUDE_DIRS "src"
    REQUIRES esp_lcd_mipi_dsi esp_lcd_touch_gt911 esp_codec_dev
)
EOF

# 3. Creazione idf_component.yml (Dipendenze)
cat <<EOF > $BASE_DIR/idf_component.yml
dependencies:
  idf: ">=5.3"
  espressif/esp_lcd_mipi_dsi: "^1.0.0"
  espressif/esp_lcd_touch_gt911: "^1.0.0"
EOF

# 4. Header principale: include/bsp/guition_jc1060.h
cat <<EOF > $BASE_DIR/include/bsp/guition_jc1060.h
#pragma once
#include "sdkconfig.h"
#include "esp_err.h"
#include "bsp_board_config.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Inizializza l'hardware della scheda Guition
 */
esp_err_t bsp_board_init(void);

/**
 * @brief Avvia il display LCD MIPI DSI (JD9165)
 */
esp_err_t bsp_display_start(void);

#ifdef __cplusplus
}
#endif
EOF

# 5. Configurazione Pin e LCD: include/bsp_board_config.h
# Basato sugli schemi forniti [1-3]
cat <<EOF > $BASE_DIR/include/bsp_board_config.h
#pragma once

/* MIPI DSI Pinout [4] */
#define BSP_LCD_MIPI_DSI_LANE_NUM          (2)
#define BSP_LCD_H_RES                      (1024)
#define BSP_LCD_V_RES                      (600)
#define BSP_LCD_PIXEL_CLOCK_HZ             (51200000) // 51.2 MHz [2]

/* Display Timing Parameters [2] */
#define BSP_LCD_H_SYNC                     (24)
#define BSP_LCD_H_BACK_PORCH               (136)
#define BSP_LCD_H_FRONT_PORCH              (160)
#define BSP_LCD_V_SYNC                     (2)
#define BSP_LCD_V_BACK_PORCH               (21)
#define BSP_LCD_V_FRONT_PORCH              (12)

/* Periferiche I2C (Touch e Audio) [3, 5] */
#define BSP_I2C_SCL                        (10)
#define BSP_I2C_SDA                        (12)

/* Touch Screen GT911 [5] */
#define BSP_TOUCH_INT                      (7)
#define BSP_TOUCH_RST                      (8)

/* Audio Codec ES8311 [1, 6, 7] */
#define BSP_AUDIO_PA_CTRL                  (GPIO_NUM_1) // NS4150 Control
#define BSP_I2S_SCLK                       (GPIO_NUM_13)
#define BSP_I2S_LRCK                       (GPIO_NUM_12)
#define BSP_I2S_DOUT                       (GPIO_NUM_9)

/* Co-processore ESP32-C6 [3, 8] */
#define BSP_C6_CHIP_PU                     (54)
#define BSP_C6_IO9                         (0)
EOF

# 6. File sorgente vuoti per implementazione
touch $BASE_DIR/src/guition_jc1060.c
touch $BASE_DIR/src/display.c
touch $BASE_DIR/src/touch.c

echo "BSP creato con successo in $BASE_DIR"
