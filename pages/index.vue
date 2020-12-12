<template>
  <div class="p-4">
    <div v-if="start">
      <TheTitle />
      <div class="text-xl text-center">
        <div
          class="text-black"
          @click="startGame()"
        >
          ひとりであそぶ
        </div>
        <div class="text-gray-600">
          ふたりであそぶ
        </div>
      </div>
    </div>
    <div v-else>
      <div class="example">
        <MyCanvas
          :side="side"
          :vertical="vertical"
        />
        <div>
          <button
            v-longclick="() => changeValue(5)"
            @click="changeValue(5)"
          >
            右
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import TheTitle from '@/components/TheTitle.vue'
import MyCanvas from '@/components/MyCanvas.vue'

export default {
  components: {
    TheTitle,
    MyCanvas,
  },
  data() {
    return {
      start: true,
      side: 50,
      vertical: 50,
    }
  },
  methods: {
    startGame() {
      this.start = false
    },
    changeValue(amount) {
      this.side = this.side + amount
    },
  },
}
</script>
