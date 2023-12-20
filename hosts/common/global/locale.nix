{ lib, ... }: {
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";

    extraLocaleSettings = {
      LANGUAGE = lib.mkDefault "en_US.UTF-8";
      LC_ALL = lib.mkDefault "en_US.UTF-8";
      LC_MEASUREMENT = lib.mkDefault "en_GB.UTF-8";
      LC_NUMERIC = lib.mkDefault "en_GB.UTF-8";
      LC_TIME = lib.mkDefault "ar_DZ.UTF-8";
    };
    
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
      "fr_FR.UTF-8/UTF-8"
      "ar_DZ.UTF-8/UTF-8"
    ];
  };

  time.timeZone = lib.mkDefault "Africa/Algiers";
}
