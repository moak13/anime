class Fixtures {
  static String fetchAllAnimes = """
{
  Page {
    media {
      siteUrl
      bannerImage
      genres
			seasonYear
      title {
        english
        native
      }
      description
    }
  }
}
        """;
}
