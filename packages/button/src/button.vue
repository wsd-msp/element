<template>
	<button :disabled="disabled" class="el-button"
			@click="handleClick"
			:autofocus="autofocus"
			:type="nativeType"
			:class="[
      type ? 'el-button--' + type : '',
      size ? 'el-button--' + size : '',
      {
        'is-disabled': disabled,
        'is-loading': loading,
        'is-plain': plain
      }
    ]"
	>
		<svg-icon class="el-icon-loading" icon="loading" v-if="loading" @click="handleInnerClick"></svg-icon>
		<svg-icon :class="'el-icon-'" :icon="icon" v-if="icon && !loading" @click="handleInnerClick"></svg-icon>
		<span v-if="$slots.default" @click="handleInnerClick"><slot></slot></span>
	</button>
</template>
<script>
  export default {
    name: 'ElButton',

    props: {
      type: {
        type: String,
        default: 'default'
      },
      size: String,
      icon: {
        type: String,
        default: ''
      },
      nativeType: {
        type: String,
        default: 'button'
      },
      loading: Boolean,
      disabled: Boolean,
      plain: Boolean,
      autofocus: Boolean
    },

    methods: {
      handleClick(evt) {
        if (!this.disabled) {
          this.$emit('click', evt);
        }
      },
      handleInnerClick(evt) {
        if (this.disabled) {
          evt.stopPropagation();
        }
      }
    }
  };
</script>
