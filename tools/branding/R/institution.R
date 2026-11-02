# CTTIR institution logo. Packages carry the hex; the institution uses a
# square, so the two never read as the same kind of thing. Four material
# ribbons interlock around a shared square core: the joined ribbons of the
# CTTIR hex mark, rebuilt on a square. Colours, type, facets and cast
# shadows all come from the v5 tokens, palette and primitives.

cttir_institution_cap <- .73  # JetBrains Mono cap height, in em

cttir_institution_style <- function(mode) {
  s <- cttir_style("brand", mode)
  if (mode == "light") s$muted <- "#424242"
  # The second T of the wordmark; lightened on dark so it stays visible.
  s$rear <- if (mode == "dark") s$mid else s$accent
  s
}

# The square tile: group-tinted face and solid brand rim, as on the hexes.
# Opaque fills the corners with the face colour for app icons and avatars.
cttir_institution_tile <- function(s, opaque = FALSE, inset = .035, r = .06) {
  if (opaque) grid::grid.rect(gp = grid::gpar(fill = s$face, col = NA))
  grid::grid.roundrect(.5, .5, 1 - 2 * inset, 1 - 2 * inset,
    r = grid::unit(r, "npc"), gp = grid::gpar(fill = s$face, col = s$rim, lwd = 5.5))
}

# Draws in a square viewport. small drops the hairline highlight.
cttir_institution_mark <- function(s, small = FALSE, opaque = FALSE) {
  cttir_institution_tile(s, opaque)
  g <- cttir_primitives(s, small)
  lo <- .20; hi <- .80; a <- .395; b <- .605
  g$P(c(lo, b, b, lo), c(b, b, hi, hi), s$paper, shadow = TRUE)
  g$P(c(b, hi, hi, b), c(a, a, hi, hi), s$accent, shadow = TRUE)
  g$P(c(a, hi, hi, a), c(lo, lo, a, a), s$deep, shadow = TRUE)
  g$P(c(lo, a, a, lo), c(lo, lo, b, b), s$light, shadow = TRUE)
  if (!small) g$L(c(hi - .03, hi - .03), c(a + .03, hi - .07),
    cttir_alpha(s$paper, .6), 1.6)
  base::invisible(NULL)
}

# CTTIR in five monospace slots, the second T in the brand colour, with the
# full name in two lines of Inter. H and W are the device size in inches.
cttir_institution_wordmark <- function(s, x0, H, W, h = .34, y = .44) {
  cap <- cttir_institution_cap
  font <- cttir_token("type", "brand_font")
  adv <- .6 * h / cap * H / W * 1.04
  letters <- c("C", "T", "T", "I", "R")
  for (i in base::seq_along(letters)) grid::grid.text(letters[i],
    x0 + (i - .5) * adv, y, just = c("centre", "bottom"),
    gp = grid::gpar(fontfamily = font, fontface = 2, fontsize = h * H * 72 / cap,
      col = if (i == 3) s$rear else s$ink))
  grid::grid.text(c("Computational Trauma and", "Tissue Injury Research"),
    x0 + .0108 * H / W, c(.30, .17), just = c("left", "centre"),
    gp = grid::gpar(fontfamily = cttir_token("type", "body_font"),
      fontsize = .085 * H * 72, col = s$muted))
  base::invisible(NULL)
}

cttir_institution_logo <- function(s, W, H) {
  grid::grid.newpage()
  grid::pushViewport(grid::viewport(x = H / W / 2, width = H / W, height = 1))
  cttir_institution_mark(s)
  grid::popViewport()
  cttir_institution_wordmark(s, H / W + .05, H, W)
}
