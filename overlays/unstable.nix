{unstable}: final: _: {
  unstable = import unstable {
    inherit (final.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
}
