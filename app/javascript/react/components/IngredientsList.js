import React from "react";

const IngredientsList = (props) => {
  let maltList = props.malts.map((malt) => {
    return (
      <li>
        {malt.name}: {malt.amount.value} {malt.amount.unit}
      </li>
    );
  });

  let hopStartList = props.hops.map((hop) => {
    if (hop.add == "start") {
      return (
        <div>
          <li>
            {hop.name}: {hop.amount.value} {hop.amount.unit}
          </li>
        </div>
      );
    }
  });
  let hopMiddleList = props.hops.map((hop) => {
    if (hop.add == "middle") {
      return (
        <div>
          <li>
            {hop.name}: {hop.amount.value} {hop.amount.unit}
          </li>
        </div>
      );
    }
  });
  let hopEndList = props.hops.map((hop) => {
    if (hop.add == "end") {
      return (
        <div>
          <li>
            {hop.name}: {hop.amount.value} {hop.amount.unit}
          </li>
        </div>
      );
    }
  });

  const yeastList = () => {
    return <ul>1 packet of {props.yeast} yeast</ul>;
  };

  return (
    <div>
      <h3 className="ingredients-title">Ingredients</h3>
      <div className="column-8">
        <h3>Malts:</h3>
        <ul>{maltList}</ul>
      </div>
      <div className="column-8">
        <h3>Hops:</h3>
        <ul className="hop-list">
          <h4>Add at the start of the boiling process:</h4>
          {hopStartList}
          <hr />
          <h4>Add 15 minutes into the boiling process:</h4>
          {hopMiddleList}
          <hr />
          <h4>Add with 5 minutes left in the boiling process:</h4>
          {hopEndList}
        </ul>
      </div>
      <div className="column-8">
        <h3>Yeast:</h3>
        {yeastList()}
      </div>
    </div>
  );
};

export default IngredientsList;
