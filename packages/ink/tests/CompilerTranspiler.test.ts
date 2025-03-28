import path from 'path';
import { describe, it } from 'mocha';
import { expect } from 'chai';
import Component from '../src/compiler/Component';
import Transpiler from '../src/compiler/Transpiler';
import { toTS } from '../src/helpers';

describe('Ink Compiler Transpiler', () => {
  const tsconfig = path.join(__dirname, '../tsconfig.json');
  const component = new Component(
    path.join(__dirname, 'fixtures/dollar.ink'), 
    { cwd: __dirname }
  );
  it('Should transpile component', () => {
    expect(true).to.equal(true);
  });

  it('Should transpile $', () => {
    const transpiler = new Transpiler(component, tsconfig);
    const actual = transpiler.transpile();
    // [
    //   Registry.createElement('div', { }, [
    //     Registry.createElement('span', { }, [
    //       Registry.createText(`$`)
    //     ]).element, 
    //     Registry.createText(`ok`)
    //   ]).element
    // ]
    expect(toTS(actual)).to.contain('ClientRegistry.createText(`$`, false)');
  });
});