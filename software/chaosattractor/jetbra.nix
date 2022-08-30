{ config, pkgs, ... }:
{
    environment.sessionVariables = {
        IDEA_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/idea.vmoptions";
        CLION_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/clion.vmoptions";
        PHPSTORM_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/phpstorm.vmoptions";
        GOLAND_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/goland.vmoptions";
        PYCHARM_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/pycharm.vmoptions";
        WEBSTORM_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/webstorm.vmoptions";
        WEBIDE_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/webide.vmoptions";
        RIDER_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/rider.vmoptions";
        DATAGRIP_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/datagrip.vmoptions";
        RUBYMINE_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/rubymine.vmoptions";
        APPCODE_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/appcode.vmoptions";
        DATASPELL_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/dataspell.vmoptions";
        GATEWAY_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/gateway.vmoptions";
        JETBRAINS_CLIENT_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/jetbrains_client.vmoptions";
        JETBRAINSCLIENT_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/jetbrainsclient.vmoptions";
        STUDIO_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/studio.vmoptions";
        DEVECOSTUDIO_VM_OPTIONS = "$HOME/.local/share/jetbra/vmoptions/devecostudio.vmoptions";
    };
}