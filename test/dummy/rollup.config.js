import babel from 'rollup-plugin-babel';
import commonjs from 'rollup-plugin-commonjs';
import npm from 'rollup-plugin-npm';
import inject from 'rollup-plugin-inject';

export default {
  format: 'iife',
  plugins: [
		babel(),
		npm({
			jsnext: true,
			main: true
		}),
		commonjs({
			inlcude: 'node_modules/**'
		}),
		inject({
			exclude: 'node_modules/**',
			$: 'jquery',
			modules: {
				$: 'jquery'
			}
		})
	]
};

