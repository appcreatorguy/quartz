import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4.0 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "🍄 manas's brain",
    pageTitleSuffix: " | 🍄",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "umami",
      host: "https://umami.alphacerium.dev",
      websiteId: "731296fb-a90e-4f5c-9f77-6aa42094c3be",
    },
    locale: "en-GB",
    baseUrl: "notes.alphacerium.dev",
    ignorePatterns: ["private", "templates", ".obsidian"],
    defaultDateType: "created",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Schibsted Grotesk",
        body: "Source Sans Pro",
        code: "JetBrains Mono",
      },
      colors: {
        lightMode: {
          light: "#eff1f5", // base
          lightgray: "#e6e9ef", // mantle
          gray: "#dce0e8", // crust
          darkgray: "#4c4f69", // text
          dark: "#5c5f77", // subtext 1
          secondary: "#8839ef", // accent color (mauve)
          tertiary: "#7287fd", // hover color (lavender)
          highlight: "rgba(136, 57, 239, 0.15)", // accent color 15% alpha
          textHighlight: "#488839ef", // accent color 30% alpha
        },
        darkMode: {
          light: "#1e1e2e",
          lightgray: "#626880", // surface 2
          gray: "#737994", // overlay 0
          darkgray: "#cdd6f4",
          dark: "#bac2de",
          secondary: "#cba6f7",
          tertiary: "#b4befe",
          highlight: "rgba(203, 166, 247, 0.15)",
          textHighlight: "#48cba6f7",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "catppuccin-latte",
          dark: "catppuccin-mocha",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
      Plugin.HardLineBreaks(),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
    ],
  },
}

export default config
