// Desktop entry point. The whole Tauri builder lives in `skypie_app::app::run`
// (skypie-core); this shell owns tauri.conf.json, the icons and the
// capabilities, so the context is generated here and handed over.
#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

fn main() {
    skypie_app::app::run(tauri::generate_context!());
}
