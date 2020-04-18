main() {
    echo "read config"
    eval $(parse_yaml ${root}/config.yml "")
    echo $version
}
