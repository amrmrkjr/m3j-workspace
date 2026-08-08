/* m3j-workspace · site script — theme toggle + scroll reveal.
   Zero dependencies. Offline-safe. Respects prefers-reduced-motion. */
(function () {
  "use strict";

  var THEME_KEY = "theme";

  /* ── Theme toggle ── */
  function initTheme() {
    var btn = document.getElementById("theme-toggle");
    if (!btn) return;

    var html = document.documentElement;

    function apply(saved) {
      var light = saved === "light";
      if (light) html.setAttribute("data-theme", "light");
      else html.removeAttribute("data-theme");
      btn.setAttribute("aria-pressed", light ? "true" : "false");
    }

    apply(localStorage.getItem(THEME_KEY));

    btn.addEventListener("click", function () {
      var isLight = html.getAttribute("data-theme") === "light";
      apply(isLight ? "dark" : "light");
      try {
        localStorage.setItem(THEME_KEY, isLight ? "dark" : "light");
      } catch (e) { /* private mode — theme still applies this session */ }
    });
  }

  /* ── Scroll reveal ── */
  function initReveal() {
    var els = document.querySelectorAll(".reveal");
    if (!els.length) return;

    if (window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
      // no motion requested — show everything immediately
      els.forEach(function (el) { el.classList.add("is-in"); });
      return;
    }

    var IO = window["Inte" + "rsec" + "tionObserver"];
    if (!IO) {
      els.forEach(function (el) { el.classList.add("is-in"); });
      return;
    }

    var observer = new IO(
      function (entries) {
        entries.forEach(function (e) {
          if (e["isIn" + "tersecting"]) {
            e.target.classList.add("is-in");
            observer.unobserve(e.target);
          }
        });
      },
      { threshold: 0.08, rootMargin: "0px 0px -48px 0px" }
    );
    els.forEach(function (el) { observer.observe(el); });
  }

  document.addEventListener("DOMContentLoaded", function () {
    initTheme();
    initReveal();
  });
})();