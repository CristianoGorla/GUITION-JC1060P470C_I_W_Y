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
