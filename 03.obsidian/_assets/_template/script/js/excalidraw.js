module.exports = async (params) => {
  const file = app.workspace.activeLeaf.view.file
  const content = await app.vault.cachedRead(file)
  let lines = await content.split("\n").filter(line => line.includes("- ["))

  const ea = ExcalidrawAutomate;
  ea.reset();
  lines.forEach((element,index) => {
    ea.addText(-100,70*index,element.replace(/^-\s/, ""))
  });
  await ea.create();
}