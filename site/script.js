document.addEventListener("DOMContentLoaded", () => {
  initTheme();
  liveClock();
});

/* ── Theme toggle ── */
function initTheme() {
  const btn = document.getElementById("theme-toggle");
  if (!btn) return;

  const saved = localStorage.getItem("theme");
  if (saved === "light") {
    document.documentElement.setAttribute("data-theme", "light");
    btn.textContent = "☀";
  }

  btn.addEventListener("click", () => {
    const html = document.documentElement;
    const isLight = html.getAttribute("data-theme") === "light";
    html.setAttribute("data-theme", isLight ? "dark" : "light");
    localStorage.setItem("theme", isLight ? "dark" : "light");
    btn.textContent = isLight ? "☾" : "☀";
  });
}

/* ── Live clock in footer ── */
function liveClock() {
  const footer = document.querySelector("footer");
  if (!footer) return;
  const clock = document.createElement("span");
  clock.style.marginLeft = "0.75rem";
  clock.style.opacity = "0.4";
  clock.style.fontSize = "0.75rem";
  footer.appendChild(clock);
  function tick() {
    const now = new Date();
    clock.textContent = now.toLocaleTimeString("en-US", { hour12: false });
  }
  tick();
  setInterval(tick, 1000);
}
