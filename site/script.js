document.addEventListener("DOMContentLoaded", () => {
  initTheme();
  animateIn();
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

/* ── One-shot fade-up on load ── */
function animateIn() {
  const els = document.querySelectorAll(".animate-in");
  els.forEach((el, i) => {
    el.style.opacity = "0";
    el.style.transform = "translateY(12px)";
    requestAnimationFrame(() => {
      el.style.transition = "opacity 0.5s ease, transform 0.5s ease";
      el.style.opacity = "1";
      el.style.transform = "translateY(0)";
      el.style.transitionDelay = `${i * 0.05}s`;
    });
  });
}

/* ── Live clock in footer ── */
function liveClock() {
  const footer = document.querySelector("footer");
  if (!footer) return;
  const clock = document.createElement("span");
  clock.style.marginLeft = "0.75rem";
  clock.style.opacity = "0.5";
  footer.appendChild(clock);
  function tick() {
    const now = new Date();
    clock.textContent = now.toLocaleTimeString("en-US", { hour12: false });
  }
  tick();
  setInterval(tick, 1000);
}
