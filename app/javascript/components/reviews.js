const changeStarColor = (event) => {
  console.log("change stars working?");
  // let element = document.getElementById(event.target.id)

  // let starId = parseInt(element.id);
  // let strId = "";
  // let i = 1;
  // while (i <= starId) {
  //   strId = i.toString();
  //   let gold = document.getElementById(strId);
  //   gold.style.color = 'gold';
  //   i++;
  // }
  // while (i <= 5) {
  //   strId = i.toString();
  //   let white = document.getElementById(strId);
  //   white.style.color = 'white';
  //   i++;
  // }
  // this.countYellowStars();
}

const countYellowStars = () => {
  console.log("count yellow stars working?");
  // debugger
  // let arr = [];
  // let stars = document.getElementsByClassName("star");
  // for (let i = 0; i < stars.length; i++) {
  //   if (stars[i].style.color === "gold"){
  //     arr.push(stars[i].style.color)
  //   };
  // };
  // this.setState({
  //   rating: arr.length
  // });
};

export { countYellowStars, changeStarColor }
