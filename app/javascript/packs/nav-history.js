export const back = () => {
  const goBack = () => {
    window.history.back();
  }

  setTimeout(() => {
    console.log(window.history);
  }, 2000)
}
