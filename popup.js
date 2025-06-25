async function refreshUI() {
  const { value } =
    await browser.browserSettings.overrideContentColorScheme.get({});
  const el = document.querySelector(`input[value="${value}"]`);
  if (el) el.checked = true;
}

// Change handler
for (const r of document.querySelectorAll('input[name="mode"]')) {
  r.addEventListener('change', async e => {
    await browser.browserSettings.overrideContentColorScheme.set({
      value: e.target.value,
    });
  });
}

refreshUI();
