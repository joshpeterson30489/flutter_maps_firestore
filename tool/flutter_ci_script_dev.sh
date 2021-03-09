#!/bin/bash

set -e

DIR="${BASH_SOURCE%/*}"
source "$DIR/flutter_ci_script_shared.sh"

declare -ar PROJECT_NAMES=(
    "add_to_app/fullscreen/flutter_module"
    "add_to_app/prebuilt_module/flutter_module"
    "add_to_app/plugin/flutter_module_using_plugin"
    "add_to_app/books/flutter_module_books"
    "add_to_app/multiple_flutters/multiple_flutters_module"
    "animations"
    "flutter_maps_firestore"
    "infinite_list"
    "ios_app_clip"
    "isolate_example"
    "jsonexample"
    "place_tracker"
    "platform_channels"
    "platform_design"
    "platform_view_swift"
    "provider_counter"
    "provider_shopper"
    "testing_app"
    "veggieseasons" 
    "experimental/desktop_photo_search"
    "experimental/federated_plugin/federated_plugin"
    "null_safety/null_safe_app"
    "null_safety/null_unsafe_app"
    "experimental/web_dashboard"
)

ci_projects "dev" "${PROJECT_NAMES[@]}"

echo "-- Success --"
