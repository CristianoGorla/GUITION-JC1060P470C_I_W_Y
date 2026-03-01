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
