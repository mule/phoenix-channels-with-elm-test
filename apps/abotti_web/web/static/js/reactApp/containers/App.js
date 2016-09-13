import React, { Component } from 'react';
import { combineReducers } from 'redux';
import { Provider } from 'react-redux';


const mapStateToProps = (state, ownProps) => {
    return {
        message: state.helloWorld.message
    };
};


const mapDispatchToProps = (dispatch, ownProps) => {
    return {
        onClick: () => {
            dispatch({ type: HELLO_WORLD });
        },
    };
};


const HelloWorld = connect(
    mapStateToProps,
    mapDispatchToProps
)(Hello);

export default HelloWorld;
